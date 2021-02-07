part of carp_study_app;

class ActivityCardDataModel extends DataModel {
  ActivityDatum _lastActivity = ActivityDatum()
    ..type = ActivityType.STILL
    ..confidence = 100;
  final Map<ActivityType, Map<int, int>> _activities = {};

  /// A map of activities oganized first by type and then by day of week.
  ///
  ///   (type,weekday,minutes)
  ///
  Map<ActivityType, Map<int, int>> get activities => _activities;

  List<Activity> activitiesByType(ActivityType type) => _activities[type]
      .entries
      .map((entry) => Activity(entry.key, entry.value))
      .toList();

  ActivityCardDataModel() : super();

  void init(StudyController controller) {
    super.init(controller);
    // initialize the activity weekly tables
    // TODO - set values to zero once a new week starts.
    ActivityType.values.forEach((type) {
      _activities[type] = {};
      for (int i = 1; i <= 7; i++)
        _activities[type][i] = Random().nextInt(300); // TODO: change back to 0
    });

    // listen for activity events and count the minutes
    controller.events.where((datum) => datum is ActivityDatum).listen((datum) {
      ActivityDatum _activity = datum as ActivityDatum;

      if (_activity.type != _lastActivity.type) {
        // if we have a new type of activity
        // add the minutes to the last know activity type
        _activities[_lastActivity.type][DateTime.now().weekday] +=
            _activity.timestamp.difference(_lastActivity.timestamp).inMinutes;
        // and then save the new activity
        _lastActivity = _activity;
      }
    });
  }

  String toString() {
    String _str = '  TYPE\t| day | min.\n';
    activities.forEach((type, data) => data.forEach((day, minutes) =>
        _str += '${type.toString().split(".").last}\t|  $day  |  $minutes\n'));
    return _str;
  }
}

class Activity {
  final int day;
  final int minutes;
  ActivityType type;

  /// Activity [type] as a string.
  String get typeString => type.toString().split(".").last;

  Activity(this.day, this.minutes);

  /// Get the localilzed name of the [day].
  String toString() => DateFormat('EEEE')
      .format(DateTime(2021, 2, 7).add(Duration(days: day)))
      .substring(0, 3);
}
