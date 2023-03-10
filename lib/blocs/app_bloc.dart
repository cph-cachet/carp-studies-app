part of carp_study_app;

enum StudyAppState {
  /// The BLOC is created (initial state)
  created,

  /// The BLOC is initialized via the [initialized] method.
  initialized,

  /// The BLOC is in the process of being configured.
  configuring,

  /// The BLOC is configured and ready to use.
  configured,
}

class StudyAppBLoC {
  StudyAppState _state = StudyAppState.created;
  final CarpBackend _backend = CarpBackend();
  final CarpStudyAppViewModel _data = CarpStudyAppViewModel();
  StudyDeploymentStatus? _status;
  WebAuthenticationSession? session;
  final StreamController<StudiesAppState> _stateStream =
      StreamController.broadcast();

  get stateStream => _stateStream;

  List<Message> _messages = [];
  final StreamController<int> _messageStreamController =
      StreamController.broadcast();
  List<Message> get messages => _messages;

  /// A stream of event when the list of [messages] is updated.
  /// The data send on the stream is the number of available messages.
  Stream<int> get messageStream => _messageStreamController.stream;

  StudyAppState get state => _state;
  bool get isInitialized => _state.index >= 1;
  bool get isConfiguring => _state.index >= 2;
  bool get isConfigured => _state.index >= 3;

  /// Debug level for the app and CAMS.
  DebugLevel debugLevel;

  /// What kind of deployment are we running - LOCAL or CAWS?
  final DeploymentMode deploymentMode;

  /// Create the BLoC for the app specifying:
  ///  * debug level
  ///  * deployment mode (LOCAL or CAWS)
  ///  * whether to use the locally stored credentials
  StudyAppBLoC({
    this.debugLevel = DebugLevel.info,
    this.deploymentMode = DeploymentMode.playground,
  }) : super();

  /// The informed consent to be shown to the user for this study.
  RPOrderedTask? informedConsent;

  InformedConsentManager get informedConsentManager =>
      (deploymentMode == DeploymentMode.playground)
          ? LocalResourceManager()
          : CarpResourceManager() as InformedConsentManager;

  LocalizationManager get localizationManager =>
      (deploymentMode == DeploymentMode.playground)
          ? LocalResourceManager()
          : CarpResourceManager() as LocalizationManager;

  LocalizationLoader get localizationLoader =>
      ResourceLocalizationLoader(localizationManager);

  MessageManager get messageManager =>
      (deploymentMode == DeploymentMode.playground)
          ? LocalResourceManager()
          : CarpResourceManager() as MessageManager;

  CarpBackend get backend => _backend;

  /// The id of the currently running study deployment.
  /// Typical set based on an invitation.
  /// `null` if no deployment have been specified.
  String? get studyDeploymentId => LocalSettings().studyDeploymentId;
  set studyDeploymentId(String? id) => LocalSettings().studyDeploymentId = id;

  // String? get studyDeploymentId => deployment?.studyDeploymentId;

  /// The deployment running on this phone.
  SmartphoneDeployment? get deployment => Sensing().controller?.deployment;

  /// Get the latest status of the study deployment.
  StudyDeploymentStatus? get status => _status;

  /// When was this study deployed on this phone.
  DateTime? get studyStartTimestamp => deployment?.deployed;

  /// The overall data model for this app
  CarpStudyAppViewModel get data => _data;

  /// Does this [deployment] have the measure of [type].
  bool hasMeasure(String type) {
    if (deployment == null) return false;

    try {
      deployment!.measures.firstWhere((measure) => measure.type == type);
    } catch (error) {
      return false;
    }

    return true;
  }

  bool hasMeasures() {
    if (deployment == null) return false;
    try {
      if (deployment!.measures.any((measure) =>
          (measure.type != VideoUserTask.imageType &&
              measure.type != VideoUserTask.videoType &&
              measure.type != AudioUserTask.audioType &&
              measure.type != SurveyUserTask.SURVEY_TYPE))) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return false;
    }
  }

  bool hasSurveys() {
    if (deployment == null) return false;
    try {
      deployment!.tasks.isNotEmpty;
      return true;
    } catch (error) {
      return false;
    }
  }

  bool hasDevices() {
    if (deployment == null) return false;
    try {
      deployment!.connectedDevices.isNotEmpty;
      return true;
    } catch (error) {
      return false;
    }
  }

  /// Initialize this BLOC. Called before being used for anything.
  Future<void> initialize() async {
    if (isInitialized) return;

    Settings().debugLevel = debugLevel;
    await Settings().init();
    await localizationManager.initialize();

    // set up and initialize sensing
    await Sensing().initialize();

    _state = StudyAppState.initialized;
    info(
        '$runtimeType initialized - deployment mode: ${deploymentMode.toString().split('.').last}');
  }

  /// This methods is used to configure a new study, including:
  ///  * authenticate the user
  ///  * get the invitation
  ///  * get the informed consent
  ///  * get the study
  ///  * initialize sensing
  ///
  /// This method is used in the [LoadingPage].
  Future<void> configure(BuildContext context) async {
    assert(isInitialized,
        "$runtimeType is not initialized. Call 'initialize()' first.");

    // early out if already configuring (e.g. waiting for user authentication)
    if (isConfiguring) return;

    stateStream.sink.add(StudiesAppState.configuring);
    info('$runtimeType configuring...');

    if (deploymentMode == DeploymentMode.playground) {
      // get the protocol from the local study protocol manager
      // note that the study id is not used
      var protocol = await LocalStudyProtocolManager().getStudyProtocol('');
      assert(protocol != null, 'Need a protocol to run locally.');

      // deploy this protocol using the on-phone deployment service
      // re-use the study deployment id - if available
      _status = await SmartPhoneClientManager()
          .deploymentService!
          .createStudyDeployment(
            protocol!,
            bloc.studyDeploymentId,
          );

      // save the deployment id on the phone for later use
      bloc.studyDeploymentId = _status!.studyDeploymentId;
    } else {
      await backend.initialize();
      await backend.getUserFromAccessToken(LocalSettings().accessToken ?? "");
      await backend.authenticate(context);

      // check if there is a local deployed id
      // if not, get a deployment id based on an invitation
      if (bloc.studyDeploymentId == null) {
        await backend.getStudyInvitation(context);
      }
    }

    // find the right informed consent, if needed
    bloc.informedConsent = (!hasInformedConsentBeenAccepted)
        ? await informedConsentManager.getInformedConsent()
        : null;

    // set up the messaging part
    messageManager.initialize().then(
      (value) {
        refreshMessages();
        // refresh the list of messages on a regular basis
        Timer.periodic(const Duration(minutes: 30), (_) => refreshMessages());
      },
    );

    // add the study and configure sensing
    await Sensing().addStudy();

    // initialize the UI data models
    data.init(Sensing().controller!);

    debug('$runtimeType configuration done.');
    _state = StudyAppState.configured;
  }

  /// Does this app use location permissions?
  bool get usingLocationPermissions =>
      SamplingPackageRegistry().permissions.any((permission) =>
          permission == Permission.location ||
          permission == Permission.locationWhenInUse ||
          permission == Permission.locationAlways);

  /// Configuration of permissions.
  ///
  /// If a [context] is provided, this method also opens the [LocationUsageDialog]
  /// if location permissions are needed and not yet granted.
  Future<void> configurePermissions([BuildContext? context]) async {
    if (usingLocationPermissions && context != null) {
      var status = await Permission.locationAlways.status;
      if (!status.isGranted && Platform.isAndroid) {
        await showGeneralDialog(
            context: context,
            barrierDismissible: false,
            barrierColor: Colors.black38,
            transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
                  filter: ui.ImageFilter.blur(
                      sigmaX: 4 * anim1.value, sigmaY: 4 * anim1.value),
                  child: FadeTransition(
                    opacity: anim1,
                    child: child,
                  ),
                ),
            pageBuilder: (context, anim1, anim2) => LocationUsageDialog().build(
                  context,
                  "ic.location.content",
                ));
        await LocationManager().requestPermission();
      }
    }
    // info('$runtimeType - asking for permissions');
    // await Sensing().askForPermissions();
  }

  /// Called when the informed consent has been accepted by the user.
  /// This entails that it has been:
  ///  * shown to the user
  ///  * accepted by the user
  Future<void> informedConsentHasBeenAccepted(
    RPTaskResult informedConsentResult,
  ) async {
    info('Informed consent has been accepted by user.');
    informedConsentAccepted = true;
    if (bloc.deploymentMode != DeploymentMode.playground) {
      await backend.uploadInformedConsent(informedConsentResult);
    }
  }

  /// Has the informed consent been shown to, and accepted by the user?
  bool get hasInformedConsentBeenAccepted =>
      LocalSettings().hasInformedConsentBeenAccepted;

  /// Should the informed consent be shown to the user?
  bool get shouldInformedConsentBeShown =>
      (informedConsent != null && !hasInformedConsentBeenAccepted);

  /// Specify if the informed consent been handled.
  /// This entails that it has been:
  ///  * shown to the user
  ///  * accepted by the user
  ///  * successfully uploaded to CARP
  set informedConsentAccepted(bool accepted) =>
      LocalSettings().informedConsentAccepted = accepted;

  /// Refresh the list of messages (news, announcements, articles) to be shown in
  /// the Study Page of the app.
  Future<void> refreshMessages() async {
    try {
      _messages = await messageManager.getMessages();
      _messages.sort((m1, m2) => m1.timestamp.compareTo(m2.timestamp));
      info('Message list refreshed - count: ${_messages.length}');
      _messageStreamController.add(_messages.length);
    } catch (error) {
      warning('Error getting messages - $error');
    }
  }

  /// The signed in user. Returns null if no user is signed in.
  CarpUser? get user => backend.user;

  String get username => (user != null)
      ? user!.username!
      : Sensing().controller!.deployment!.userId!;

  /// The name used for friendly greating - '' if no user logged in.
  String? get friendlyUsername => (user != null) ? user!.firstName : '';

  /// Is sensing running, i.e. has the study executor been resumed?
  bool get isRunning => Sensing().isRunning;

  /// the list of running - i.e. used - probes in this study.
  List<Probe> get runningProbes => (Sensing().controller != null)
      ? Sensing().controller!.executor!.probes
      : [];

  /// Get a list of running devices
  Iterable<DeviceModel> get runningDevices =>
      Sensing().runningDevices!.map((device) => DeviceModel(device));

  /// Map a selected device to the device in the protocol and connect to it.
  void connectToDevice(BluetoothDevice selectedDevice, DeviceManager device) {
    if (device is BTLEDeviceManager) {
      device.btleAddress = selectedDevice.id.id;
      device.btleName = selectedDevice.name;
    }

    // when the device id is updated, save the deployment
    Sensing().controller?.saveDeployment();

    device.connect();
  }

  /// Start sensing. Should only be called once.
  /// Use [resume] and [pause] if pausing/resuming sensing.
  ///
  /// Ensures that permissions are requested.
  Future<void> start() async {
    assert(Sensing().controller != null,
        'No Study Controller - the study has not been deployed.');

    Sensing().controller?.start();

    // listening on the data stream and print them as json to the debug console
    Sensing().controller!.data.listen((data) => debug(toJsonString(data)));
  }

  // Pause sensing.
  void pause() => Sensing().controller?.executor?.pause();

  /// Resume sensing.
  void resume() => Sensing().controller?.executor?.resume();

  // Dispose the entire sensing.
  void dispose() => Sensing().controller?.dispose();

  /// Add a [Datum] object to the stream of events.
  void addDatum(Datum datum) =>
      Sensing().controller!.executor!.addDataPoint(DataPoint.fromData(datum));

  /// Add a error to the stream of events.
  void addError(Object error, [StackTrace? stacktrace]) =>
      Sensing().controller!.executor!.addError(error, stacktrace);

  /// Leave the study deployed on this phone.
  ///
  /// This entails
  ///  * stopping sensing
  ///  * removing the study info from the phone
  ///  * resetting the informed consent flow
  ///  * returning the user to select an invitation for another study
  ///
  /// Note that study deployment information and data is not removed from the
  /// phone. This is stored for later access. Or if the same deployment is
  /// re-deployed on the phone, data from the previous deployment will be
  /// available.
  Future<void> leaveStudy() async {
    final id = studyDeploymentId;
    _state = StudyAppState.initialized;
    informedConsentAccepted = false;
    await LocalSettings().eraseStudyIds();
    await Sensing().removeStudy();
    // a small hack; reuse and reload the same deployment - but only in local mode
    if (deploymentMode == DeploymentMode.playground) studyDeploymentId = id;
  }

  /// Leave the study and also sign out the user.
  ///
  /// This entails everything from the [leaveStudy] method plus permanently
  /// deleting all user authentication information from this phone, including
  /// the authentication and refresh tokens.
  Future<void> leaveStudyAndSignOut() async {
    await leaveStudy();
    await backend.signOut();
  }

  Future<WebAuthenticationSession> startWebAuthenticationSession(
    WebAuthenticationSession session,
  ) async {
    await session.start();
    bloc.stateStream.sink.add(StudiesAppState.authenticating);

    return session;
  }

  Future<WebAuthenticationSession?> createWebAuthenticationSession(
    WebAuthenticationSession? session,
    WebUri url,
  ) async {
    if (session == null &&
        Platform.isIOS &&
        await WebAuthenticationSession.isAvailable()) {
      session = await WebAuthenticationSession.create(
          url: url,
          callbackURLScheme: 'carp.studies',
          onComplete: (url, error) async {
            if (error != null) {
              warning('Error: $error');
              return;
            } else if (url == null) {
              warning('No url returned');
              return;
            } else if (!url.toString().contains('token')) {
              warning('No access token in url: $url');
              return;
            }
            info('Got url: $url');
            String accessToken = url.queryParameters['token']!;
            String refreshToken = url.queryParameters['refresh']!;
            String expiresIn = url.queryParameters['expiresIn']!;
            
            LocalSettings().accessToken = accessToken;
            bloc.stateStream.sink.add(StudiesAppState.accessTokenRetrieved);
          });
      return session;
    }
    return session;
  }
}

enum StudiesAppState {
  loginpage,
  authenticating,
  accessTokenRetrieved,
  configuring,
  loading,
  loaded,
  error,
}
