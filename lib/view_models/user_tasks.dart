part of carp_study_app;

/// A [UserTaskFactory] that can handle the user tasks in this app.
class AppUserTaskFactory implements UserTaskFactory {
  @override
  List<String> types = [
    AudioUserTask.AUDIO_TYPE,
    VideoUserTask.VIDEO_TYPE,
  ];

  @override
  UserTask create(AppTaskExecutor executor) {
    switch (executor.task.type) {
      case AudioUserTask.AUDIO_TYPE:
        return AudioUserTask(executor);
      case VideoUserTask.VIDEO_TYPE:
        return VideoUserTask(executor);
      default:
        return BackgroundSensingUserTask(executor);
    }
  }
}

/// A user task handling audio recordings.
/// When started, creates a [AudioTaskPage] and shows it to the user.
class AudioUserTask extends UserTask {
  static const String AUDIO_TYPE = 'audio';

  StreamController<int> _countDownController = StreamController.broadcast();
  Stream<int>? get countDownEvents => _countDownController.stream;

  /// Total duration of audio recording in seconds.
  int recordingDuration = 60;

  /// Seconds left in ongoing recording
  int ongoingRecordingDuration = 60;

  AudioUserTask(AppTaskExecutor executor) : super(executor) {
    recordingDuration = (executor.task.minutesToComplete != null)
        ? executor.task.minutesToComplete! * 60
        : 60;
  }

  void onStart(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => AudioTaskPage(audioUserTask: this)),
    );
  }

  Timer? _timer;

  /// Callback when recording is to start.
  void onRecordStart() {
    ongoingRecordingDuration = recordingDuration;
    state = UserTaskState.started;
    executor.resume();

    _timer = Timer.periodic(new Duration(seconds: 1), (_) {
      _countDownController.add(--ongoingRecordingDuration);

      if (ongoingRecordingDuration <= 0) {
        _timer?.cancel();
        _countDownController.close();

        executor.pause();
        state = UserTaskState.done;
      }
    });
  }

  /// Callback when recording is to stop.
  void onRecordStop() {
    _timer?.cancel();
    _countDownController.close();

    executor.pause();
    state = UserTaskState.done;
  }
}

/// A user task handling video and image recordings.
/// When started, creates a [CameraTaskPage] and shows it to the user.
class VideoUserTask extends UserTask {
  static const String VIDEO_TYPE = 'video';

  VideoUserTask(AppTaskExecutor executor) : super(executor);

  void onStart(BuildContext context) async {
    super.onStart(context);

    final cameras = await availableCameras();
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              CameraTaskPage(videoUserTask: this, cameras: cameras)),
    );
  }

  DateTime? _startRecordingTime, _endRecordingTime;
  XFile? file;
  MediaType _videoType = MediaType.image;

  /// Callback when a picture is captured.
  void onPictureCapture(XFile image) {
    onRecordStart();

    // now wait for 2 secs to finish up any other sensing in the task
    Timer(const Duration(seconds: 2),
        () => onRecordStop(image, videoType: MediaType.image));
  }

  /// Callback when video recording is started.
  void onRecordStart() {
    _startRecordingTime = DateTime.now();
    state = UserTaskState.started;
    executor.resume();
  }

  /// Callback when video recording is stopped.
  void onRecordStop(XFile video, {MediaType videoType = MediaType.video}) {
    executor.pause();
    file = video;
    _videoType = videoType;
    state = UserTaskState.done;
  }

  /// Callback when the recorded image/video is to be "saved", i.e. committed to
  /// data stream.
  void onSave() {
    if (file != null) {
      // create the datum directly here...
      MediaDatum datum = MediaDatum(
        mediaType: _videoType,
        filename: file!.path,
        startRecordingTime: _startRecordingTime!,
        endRecordingTime: _endRecordingTime,
      )..filename = file!.path.split("/").last;

      // ... and add it to the sensing controller
      bloc.addDatum(datum);
    }
  }
}
