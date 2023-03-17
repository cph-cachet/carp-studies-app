part of carp_study_app;

class CarpBackend {
  /// The URI of the CARP Web Service (CAWS) host.
  static const String cawsUri = "https://cans.cachet.dk";

  /// The URL of the CARP Privacy Policy for this app.
  static const String carpPrivacyUrl =
      "https://carp.cachet.dk/privacy-policy-app";

  /// The URL of the official CARP Web Site.
  static const String carpWebsiteUrl = "https://carp.cachet.dk";

  static const Map<DeploymentMode, String> uris = {
    DeploymentMode.dev: '/dev',
    DeploymentMode.test: '/test',
    DeploymentMode.staging: '/stage',
    DeploymentMode.production: '',
    DeploymentMode.playground: '/playground',
  };

  static final CarpBackend _instance = CarpBackend._();

  String get clientId => "carp";
  String get clientSecret => "carp";

  CarpApp? _app;

  /// The CAWS app configuration.
  CarpApp? get app => _app;

  /// Has the user been authenticated?
  bool? get isAuthenticated => user != null;

  /// The authenticated user
  CarpUser? get user => CarpService().currentUser;

  /// The URI of the CANS server - depending on deployment mode.
  Uri get uri => Uri(
        scheme: 'https',
        host: 'cans.cachet.dk',
        pathSegments: [
          'dev',
          // uris[bloc.deploymentMode]!,
        ],
      );

  OAuthToken? get oauthToken => LocalSettings().oauthToken;
  set oauthToken(OAuthToken? token) => LocalSettings().oauthToken = token;

  String? get username => LocalSettings().username;
  set username(String? username) => LocalSettings().username = username;

  String? get studyId => LocalSettings().studyId;

  set studyId(String? id) {
    if (CarpService().isConfigured) CarpService().app!.studyId = id;
    LocalSettings().studyId = id!;
  }

  String? get studyDeploymentId => LocalSettings().studyDeploymentId;

  set studyDeploymentId(String? id) {
    if (CarpService().isConfigured) CarpService().app!.studyDeploymentId = id;
    LocalSettings().studyDeploymentId = id;
  }

  CarpBackend._() : super() {
    // make sure that the json functions are loaded
    CarpMobileSensing();
    CognitionPackage();
  }

  factory CarpBackend() => _instance;

  Future<void> initialize() async {
    _app = CarpApp(
      name: "CAWS @ DTU",
      uri: uri,
      oauth: OAuthEndPoint(clientID: clientId, clientSecret: clientSecret),
      studyId: LocalSettings().studyId,
      studyDeploymentId: LocalSettings().studyDeploymentId,
    );

    CarpService().configure(app!);
    info('$runtimeType initialized - app: $_app');
  }

  /// Authenticate the user like this:
  /// * check if a local username and token is saved on the phone
  /// * if so, use this and try to authenticate
  /// * else authenticate using the username / password dialogue
  /// * if successful, save the token locally
  Future<void> authenticate() async {
    info('Authenticating user...');
    if (username != null && oauthToken != null) {
      info('Authenticating with saved token - token: $oauthToken');
      try {
        await CarpService()
            .authenticateWithToken(username: username!, token: oauthToken!);
      } catch (error) {
        warning('Authentication with saved token unsuccessful - $error');
      }
    }

    if (user == null) {
      info('Authenticating with dialogue - username: $username');
      await CarpService().authenticateWithToken(token: oauthToken!);
      if (CarpService().authenticated) {
        username = CarpService().currentUser?.username;
      }
    }

    info('User authenticated - user: $user');
    // saving token on the phone
    oauthToken = user?.token!;

    // configure the participation service in order to get the invitations
    CarpParticipationService().configureFrom(CarpService());
  }

  Future<OAuthToken?> authenticateWithRefreshToken(String refreshToken) async {
    try {
      var token = await CarpService().authenticateByRefreshToken(refreshToken);

      oauthToken = token;
      bloc.stateStream.sink.add(StudiesAppState.accessTokenRetrieved);

      return token;
    } catch (e) {
      bloc.scaffoldMessengerState.showSnackBar(SnackBar(content: Text('$e')));
      warning('Authentication with refresh token unsuccessful - $e');
    }
    return null;
  }

  /// Get all study invitations for the current user.
  /// If the user is not authenticated, this will return an empty list.
  /// If the user is authenticated, this will return a list of invitations.
  /// If the user is authenticated, but has no invitations, this will return an empty list.
  Future<List<ActiveParticipationInvitation>> getInvitations() async {
    if (CarpService().authenticated) {
      List<ActiveParticipationInvitation> invitations =
          await CarpParticipationService().getActiveParticipationInvitations();
      bloc.invitations = invitations;
      return invitations;
    }
    return [];
  }

  /// Get the study invitation.
  Future<void> getStudyInvitation(BuildContext context) async {
    if (studyDeploymentId == null) {
      ActiveParticipationInvitation? invitation =
          await CarpParticipationService().getStudyInvitation(context);
      debug('CARP Study Invitation: $invitation');

      studyId = invitation?.studyId! as String;
      studyDeploymentId = invitation?.studyDeploymentId! as String;
    }
    info('Study ID: $studyId');
    info('Deployment ID: $studyDeploymentId');
  }

  Future<ConsentDocument?> uploadInformedConsent(
      RPTaskResult taskResult) async {
    RPConsentSignatureResult signatureResult =
        (taskResult.results["consentreviewstepID"] as RPConsentSignatureResult);
    signatureResult.userID = username;
    Map<String, dynamic> informedConsent = signatureResult.toJson();

    ConsentDocument? document;
    try {
      document = await CarpService().createConsentDocument(informedConsent);
      info(
          'Informed consent document uploaded successfully - id: ${document.id}');
      bloc.informedConsentAccepted = true;
    } on Exception {
      bloc.informedConsentAccepted = false;
      warning('Informed consent upload failed for username: $username');
    }

    return document;
  }

  Future<void> signOut() async {
    if (CarpService().authenticated) await CarpService().signOut();
    await LocalSettings().eraseAuthCredentials();
  }
}
