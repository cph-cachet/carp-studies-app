part of carp_study_app;

class HeartRateCardViewModel extends SerializableViewModel<HourlyHeartRate> {
  @override
  HourlyHeartRate createModel() => HourlyHeartRate();

  /// A map of heart rate values for each hour of the day.
  /// The key is the hour of the day (0-23) and the value is the min and max heart rate for that hour.
  Map<int, HeartRateMinMaxPrHour> get hourlyHeartRate => model.hourlyHeartRate;

  /// The current heart rate
  double? get currentHeartRate => model.currentHeartRate;

  // If the device is touching skin. Returns true if the device is touching skin, false otherwise.
  // If the device is not capable of detecting skin contact, this value is always true.
  bool contactStatus = false;

  HeartRateMinMaxPrHour get dayMinMax =>
      HeartRateMinMaxPrHour(model.minHeartRate, model.maxHeartRate);

  /// Stream of heart rate [PolarHRDatum] measures.
  Stream<DataPoint>? get heartRateEvents =>
      controller?.data.where((dataPoint) => dataPoint.data is PolarHRDatum);

  @override
  void init(SmartphoneDeploymentController ctrl) {
    super.init(ctrl);

    heartRateEvents?.listen(
      (heartRateDataPoint) {
        PolarHRDatum? heartRate = heartRateDataPoint.data as PolarHRDatum;

        double hr = heartRate.hr.toDouble();
        if (!(hr > 0)) {
          contactStatus = false;
          model.currentHeartRate = null;
          return;
        }
        model.addHeartRate(DateTime.now().hour, hr);

        if (hr > (model.maxHeartRate ?? 0)) {
          model.maxHeartRate = hr;
        }
        if (hr < (model.minHeartRate ?? 100000)) {
          model.minHeartRate = hr;
        }

        contactStatus =
            heartRate.contactStatusSupported ? heartRate.contactStatus : true;

        model.resetDataAtMidnight();
      },
    );
  }
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class HourlyHeartRate extends DataModel {
  /// A map of heart rate values for each hour of the day.
  ///
  ///    (hour of the day, min and max heart rate for that hour)
  ///
  /// The hour of the day is expressed as an integer between 0 and 23.
  /// The min and max heart rate is expressed as a [HeartRateMinMaxPrHour] object.
  Map<int, HeartRateMinMaxPrHour> hourlyHeartRate = {};

  HourlyHeartRate() {
    for (int i = 0; i < 24; i++) {
      hourlyHeartRate[i] = HeartRateMinMaxPrHour(null, null);
    }
  }

  /// The last updated time of the heart rate.
  /// Used to reset the data at midnight.
  DateTime lastUpdated = DateTime.now();

  /// The current heart rate
  @JsonKey(ignore: true)
  double? currentHeartRate;

  /// The minimum and maximum heart rate for the day
  /// Used to scale the graph
  double? maxHeartRate;
  double? minHeartRate;

  void resetDataAtMidnight() {
    if (lastUpdated.hour != DateTime.now().hour) {
      for (int i = 0; i < 24; i++) {
        hourlyHeartRate[i] = HeartRateMinMaxPrHour(null, null);
      }
      maxHeartRate = null;
      minHeartRate = null;
    }
    lastUpdated = DateTime.now();
  }

  /// Add a heart rate value for a given hour.
  /// If the hour already exists, the min and max values are updated.
  /// If the hour does not exist, it is added.
  void addHeartRate(int hour, double heartRate) {
    currentHeartRate = heartRate;
    if (hourlyHeartRate.containsKey(hour)) {
      hourlyHeartRate.update(
        hour,
        (value) => value
          ..min = value.min != null ? min(value.min!, heartRate) : heartRate
          ..max = value.max != null ? max(value.max!, heartRate) : heartRate,
      );
    } else {
      hourlyHeartRate[hour] = HeartRateMinMaxPrHour(heartRate, heartRate);
    }
  }

  @override
  String toString() {
    String str = 'time | heart rate\n';
    hourlyHeartRate
        .forEach((time, heartRate) => str += '$time  | $heartRate\n');
    return str;
  }

  @override
  HourlyHeartRate fromJson(Map<String, dynamic> json) =>
      _$HourlyHeartRateFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$HourlyHeartRateToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class HeartRateMinMaxPrHour {
  double? min;
  double? max;

  HeartRateMinMaxPrHour(this.min, this.max);

  @override
  String toString() => {'min': min, 'max': max}.toString();

  factory HeartRateMinMaxPrHour.fromJson(Map<String, dynamic> json) =>
      _$HeartRateMinMaxPrHourFromJson(json);
  Map<String, dynamic> toJson() => _$HeartRateMinMaxPrHourToJson(this);
}
