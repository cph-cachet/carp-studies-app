/*
 * Copyright 2021 Copenhagen Center for Health Technology (CACHET) at the
 * Technical University of Denmark (DTU).
 * Use of this source code is governed by a MIT-style license that can be
 * found in the LICENSE file.
 */

part of carp_study_app;

/// This class implements the sensing layer.
///
/// Call [initialize] to setup a deployment using a CARP deployment.
/// Once initialized, use the [addStudy] method to add the study to this runtime.
/// The runtime [controller] can be used to control the study execution
/// (i.e., start or stop).
///
/// Note that this class is a singleton and only one sensing layer is used.
/// The current assumption at the moment is that this Study App only
/// runs one study at a time, even though CAMS supports that several studies
/// added to the [client].
class Sensing {
  static final Sensing _instance = Sensing._();
  StudyDeploymentStatus? _status;
  SmartphoneDeploymentController? _controller;
  DeploymentService? deploymentService;
  Study? _study;

  /// The study running on this phone.
  /// Only available after [addStudy] is called.
  Study? get study => _study;

  /// The deployment running on this phone.
  /// Only available after [addStudy] is called.
  SmartphoneDeployment? get deployment => _controller?.deployment;

  /// The latest status of the study deployment.
  StudyDeploymentStatus? get status => _status;

  /// The role name of this device in the deployed study.
  String? get deviceRoleName => _study?.deviceRoleName;

  /// The study deployment id of the deployment running on this phone.
  String? get studyDeploymentId => _study?.studyDeploymentId;

  /// The study runtime for this deployment.
  SmartphoneDeploymentController? get controller => _controller;

  /// Is sensing running, i.e. has the study executor been started?
  bool get isRunning =>
      (controller != null) &&
      controller!.executor.state == ExecutorState.started;

  /// The list of running - i.e. used - probes in this study.
  List<Probe> get runningProbes =>
      (_controller != null) ? _controller!.executor.probes : [];

  /// The list of connected devices.
  List<DeviceManager>? get runningDevices =>
      SmartPhoneClientManager().deviceController.connectedDevices;

  /// The singleton sensing instance
  factory Sensing() => _instance;

  Sensing._() {
    // create and register external sampling packages
    //SamplingPackageRegistry().register(ConnectivitySamplingPackage());
    SamplingPackageRegistry().register(ContextSamplingPackage());
    //SamplingPackageRegistry.register(CommunicationSamplingPackage());
    SamplingPackageRegistry().register(MediaSamplingPackage());
    SamplingPackageRegistry().register(SurveySamplingPackage());
    // SamplingPackageRegistry().register(HealthSamplingPackage());
    SamplingPackageRegistry().register(ESenseSamplingPackage());
    SamplingPackageRegistry().register(PolarSamplingPackage());
    SamplingPackageRegistry().register(MovesenseSamplingPackage());

    // create and register external data managers
    DataManagerRegistry().register(CarpDataManagerFactory());

    // register the special-purpose audio user task factory
    AppTaskController().registerUserTaskFactory(AppUserTaskFactory());
  }

  /// Initialize and set up sensing.
  Future<void> initialize() async {
    info('Initializing $runtimeType - mode: ${bloc.deploymentMode}');

    // Set up the devices available on this phone
    DeviceController().registerAllAvailableDevices();

    switch (bloc.deploymentMode) {
      case DeploymentMode.local:
        // Use the local, phone-based deployment service.
        deploymentService = SmartphoneDeploymentService();

        // Get the protocol from the local study protocol manager.
        // Note that the study id is not used since it always returns the same protocol.
        var protocol = await LocalResourceManager().getStudyProtocol('');

        // Deploy this protocol using the on-phone deployment service.
        // Reuse the study deployment id, if this is stored on the phone.
        _status = await SmartphoneDeploymentService().createStudyDeployment(
          protocol!,
          [],
          bloc.studyDeploymentId,
        );

        // Save the correct deployment id on the phone for later use.
        bloc.studyDeploymentId = _status?.studyDeploymentId;
        bloc.deviceRoleName = _status?.primaryDeviceStatus?.device.roleName;

        break;
      case DeploymentMode.production:
      case DeploymentMode.test:
      case DeploymentMode.dev:
        // Use the CARP deployment service which can download a protocol from CAWS
        CarpDeploymentService().configureFrom(CarpService());
        deploymentService = CarpDeploymentService();

        break;
    }

    // Register the CARP data manager for uploading data back to CAWS.
    // This is needed in both LOCAL and CARP deployments, since a local study
    // protocol may still upload to CAWS
    DataManagerRegistry().register(CarpDataManagerFactory());

    // Create and configure a client manager for this phone
    await SmartPhoneClientManager().configure(
      deploymentService: deploymentService,
      deviceController: DeviceController(),

      // Need to ask for permissions all at once on Android.
      askForPermissions: Platform.isAndroid ? true : false,
    );

    info('$runtimeType initialized');
  }

  /// Add and deploy the study, and configure the study runtime (sampling).
  Future<void> addStudy() async {
    assert(SmartPhoneClientManager().isConfigured,
        'The client manager is not yet configured. Call SmartPhoneClientManager().configure() before adding a study.');
    assert(bloc.studyDeploymentId != null,
        'No study deployment ID is provided. Cannot start deployment w/o an id.');

    // Define the study and add it to the client.
    _study = await SmartPhoneClientManager().addStudy(
      bloc.studyDeploymentId!,
      bloc.deviceRoleName!,
    );

    // Get the study controller and try to deploy the study.
    //
    // Note that if the study has already been deployed on this phone it has
    // been cached locally and the local version will be used pr. default.
    // If not deployed before (i.e., cached) the study deployment will be
    // fetched from the deployment service.
    _controller = SmartPhoneClientManager().getStudyRuntime(study!);
    await controller?.tryDeployment(useCached: true);

    // Make sure to translate the user tasks in the study protocol before using
    // them in the app's task list.
    translateStudyProtocol();

    // Configure the controller
    await controller?.configure();

    // Listening on the data stream and print them as json to the debug console
    controller?.measurements
        .listen((measurement) => debug(toJsonString(measurement)));

    info('$runtimeType study added: $studyDeploymentId');
  }

  Future<void> removeStudy() async {
    if (study != null) await SmartPhoneClientManager().removeStudy(study!);
  }

  /// Translate the title and description of all AppTask in the study protocol
  /// of the current master deployment.
  void translateStudyProtocol([RPLocalizations? localization]) {
    bloc.localization ??= localization;

    // Fast out is no localization
    if (bloc.localization == null) return;

    // Fast out, if not configured or no protocol
    if (controller?.status != StudyStatus.Deployed ||
        controller?.deployment == null) return;

    for (var task in controller!.deployment!.tasks) {
      if (task is AppTask) {
        task.title = bloc.localization!.translate(task.title);
        task.description = bloc.localization!.translate(task.description);
      }
    }

    info(
        "$runtimeType - Study protocol translated to locale '${bloc.localization!.locale}'");
  }

  Future<void> askForPermissions() async =>
      await SmartPhoneClientManager().askForAllPermissions();
}
