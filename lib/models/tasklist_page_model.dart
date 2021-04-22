part of carp_study_app;

class TaskListPageModel extends DataModel {
  TaskListPageModel();

  /// The list of available app tasks for the user to address.
  List<UserTask> get tasks => AppTaskController().userTaskQueue;

  /// A stream of [UserTask]s as they are generated.
  Stream<UserTask> get userTaskEvents => AppTaskController().userTaskEvents;

  // /// The number of days the user has been part of this study.
  // int get daysInStudy => (bloc.studyStartTimestamp != null)
  //     ? DateTime.now().difference(bloc.studyStartTimestamp).inDays + 1
  //     : 0;

  // /// The number of tasks completed so far.
  // int get taskCompleted => AppTaskController()
  //     .userTaskQueue
  //     .where((task) => task.state == UserTaskState.done)
  //     .length;

  // void init(StudyController controller) {
  //   super.init(controller);
  // }
}
