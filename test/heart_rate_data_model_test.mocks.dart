// Mocks generated by Mockito 5.4.0 from annotations
// in carp_study_app/test/heart_rate_data_model_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:carp_core/carp_core.dart' as _i3;
import 'package:carp_mobile_sensing/carp_mobile_sensing.dart' as _i2;
import 'package:carp_polar_package/carp_polar_package.dart' as _i6;
import 'package:carp_study_app/main.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeDeviceController_0 extends _i1.SmartFake
    implements _i2.DeviceController {
  _FakeDeviceController_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeData_1 extends _i1.SmartFake implements _i3.Data {
  _FakeData_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDeploymentService_2 extends _i1.SmartFake
    implements _i3.DeploymentService {
  _FakeDeploymentService_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeHeartRateMinMaxPrHour_3 extends _i1.SmartFake
    implements _i4.HeartRateMinMaxPrHour {
  _FakeHeartRateMinMaxPrHour_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeHourlyHeartRate_4 extends _i1.SmartFake
    implements _i4.HourlyHeartRate {
  _FakeHourlyHeartRate_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDateTime_5 extends _i1.SmartFake implements DateTime {
  _FakeDateTime_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDataType_6 extends _i1.SmartFake implements _i3.DataType {
  _FakeDataType_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDataModel_7 extends _i1.SmartFake implements _i4.DataModel {
  _FakeDataModel_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [SmartphoneDeploymentController].
///
/// See the documentation for Mockito's code generation for more information.
class MockSmartphoneDeploymentController extends _i1.Mock
    implements _i2.SmartphoneDeploymentController {
  @override
  _i2.DeviceController get deviceRegistry => (super.noSuchMethod(
        Invocation.getter(#deviceRegistry),
        returnValue: _FakeDeviceController_0(
          this,
          Invocation.getter(#deviceRegistry),
        ),
        returnValueForMissingStub: _FakeDeviceController_0(
          this,
          Invocation.getter(#deviceRegistry),
        ),
      ) as _i2.DeviceController);
  @override
  String get privacySchemaName => (super.noSuchMethod(
        Invocation.getter(#privacySchemaName),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  _i2.DataTransformer get transformer => (super.noSuchMethod(
        Invocation.getter(#transformer),
        returnValue: (_i3.Data __p0) => _FakeData_1(
          this,
          Invocation.getter(#transformer),
        ),
        returnValueForMissingStub: (_i3.Data __p0) => _FakeData_1(
          this,
          Invocation.getter(#transformer),
        ),
      ) as _i2.DataTransformer);
  @override
  _i5.Stream<_i3.Measurement> get measurements => (super.noSuchMethod(
        Invocation.getter(#measurements),
        returnValue: _i5.Stream<_i3.Measurement>.empty(),
        returnValueForMissingStub: _i5.Stream<_i3.Measurement>.empty(),
      ) as _i5.Stream<_i3.Measurement>);
  @override
  int get samplingSize => (super.noSuchMethod(
        Invocation.getter(#samplingSize),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);
  @override
  set deployment(_i3.PrimaryDeviceDeployment? _deployment) =>
      super.noSuchMethod(
        Invocation.setter(
          #deployment,
          _deployment,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set deviceRegistry(_i3.DeviceDataCollectorFactory? _deviceRegistry) =>
      super.noSuchMethod(
        Invocation.setter(
          #deviceRegistry,
          _deviceRegistry,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i3.DeploymentService get deploymentService => (super.noSuchMethod(
        Invocation.getter(#deploymentService),
        returnValue: _FakeDeploymentService_2(
          this,
          Invocation.getter(#deploymentService),
        ),
        returnValueForMissingStub: _FakeDeploymentService_2(
          this,
          Invocation.getter(#deploymentService),
        ),
      ) as _i3.DeploymentService);
  @override
  set deploymentService(_i3.DeploymentService? _deploymentService) =>
      super.noSuchMethod(
        Invocation.setter(
          #deploymentService,
          _deploymentService,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set deploymentStatus(_i3.StudyDeploymentStatus? _deploymentStatus) =>
      super.noSuchMethod(
        Invocation.setter(
          #deploymentStatus,
          _deploymentStatus,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i5.Stream<_i3.StudyStatus> get statusEvents => (super.noSuchMethod(
        Invocation.getter(#statusEvents),
        returnValue: _i5.Stream<_i3.StudyStatus>.empty(),
        returnValueForMissingStub: _i5.Stream<_i3.StudyStatus>.empty(),
      ) as _i5.Stream<_i3.StudyStatus>);
  @override
  set status(_i3.StudyStatus? newStatus) => super.noSuchMethod(
        Invocation.setter(
          #status,
          newStatus,
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool get isInitialized => (super.noSuchMethod(
        Invocation.getter(#isInitialized),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  bool get isDeployed => (super.noSuchMethod(
        Invocation.getter(#isDeployed),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  bool get isStopped => (super.noSuchMethod(
        Invocation.getter(#isStopped),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  List<_i3.DeviceConfiguration<_i3.DeviceRegistration>>
      get remainingDevicesToRegister => (super.noSuchMethod(
            Invocation.getter(#remainingDevicesToRegister),
            returnValue: <_i3.DeviceConfiguration<_i3.DeviceRegistration>>[],
            returnValueForMissingStub: <
                _i3.DeviceConfiguration<_i3.DeviceRegistration>>[],
          ) as List<_i3.DeviceConfiguration<_i3.DeviceRegistration>>);
  @override
  _i5.Stream<_i3.Measurement> measurementsByType(String? type) =>
      (super.noSuchMethod(
        Invocation.method(
          #measurementsByType,
          [type],
        ),
        returnValue: _i5.Stream<_i3.Measurement>.empty(),
        returnValueForMissingStub: _i5.Stream<_i3.Measurement>.empty(),
      ) as _i5.Stream<_i3.Measurement>);
  @override
  _i5.Future<_i3.StudyStatus> tryDeployment({bool? useCached = true}) =>
      (super.noSuchMethod(
        Invocation.method(
          #tryDeployment,
          [],
          {#useCached: useCached},
        ),
        returnValue: _i5.Future<_i3.StudyStatus>.value(
            _i3.StudyStatus.DeploymentNotStarted),
        returnValueForMissingStub: _i5.Future<_i3.StudyStatus>.value(
            _i3.StudyStatus.DeploymentNotStarted),
      ) as _i5.Future<_i3.StudyStatus>);
  @override
  _i5.Future<bool> saveDeployment() => (super.noSuchMethod(
        Invocation.method(
          #saveDeployment,
          [],
        ),
        returnValue: _i5.Future<bool>.value(false),
        returnValueForMissingStub: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
  @override
  _i5.Future<bool> restoreDeployment() => (super.noSuchMethod(
        Invocation.method(
          #restoreDeployment,
          [],
        ),
        returnValue: _i5.Future<bool>.value(false),
        returnValueForMissingStub: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
  @override
  _i5.Future<void> eraseDeployment() => (super.noSuchMethod(
        Invocation.method(
          #eraseDeployment,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<void> configure({
    _i2.DataEndPoint? dataEndPoint,
    String? privacySchemaName = r'dk.cachet.carp',
    _i2.DataTransformer? transformer,
    int? coverageFrequency = 5,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #configure,
          [],
          {
            #dataEndPoint: dataEndPoint,
            #privacySchemaName: privacySchemaName,
            #transformer: transformer,
            #coverageFrequency: coverageFrequency,
          },
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  void start([bool? start = true]) => super.noSuchMethod(
        Invocation.method(
          #start,
          [start],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i5.Future<void> stop() => (super.noSuchMethod(
        Invocation.method(
          #stop,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<void> remove() => (super.noSuchMethod(
        Invocation.method(
          #remove,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i5.Future<void> addStudy(
    _i3.Study? study,
    _i3.DeviceRegistration? deviceRegistration,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #addStudy,
          [
            study,
            deviceRegistration,
          ],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<_i3.StudyDeploymentStatus?> getStudyDeploymentStatus() =>
      (super.noSuchMethod(
        Invocation.method(
          #getStudyDeploymentStatus,
          [],
        ),
        returnValue: _i5.Future<_i3.StudyDeploymentStatus?>.value(),
        returnValueForMissingStub:
            _i5.Future<_i3.StudyDeploymentStatus?>.value(),
      ) as _i5.Future<_i3.StudyDeploymentStatus?>);
  @override
  _i5.Future<void> tryRegisterConnectedDevice(
          _i3.DeviceConfiguration<_i3.DeviceRegistration>? device) =>
      (super.noSuchMethod(
        Invocation.method(
          #tryRegisterConnectedDevice,
          [device],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<void> tryRegisterRemainingDevicesToRegister() =>
      (super.noSuchMethod(
        Invocation.method(
          #tryRegisterRemainingDevicesToRegister,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
}

/// A class which mocks [HeartRateCardViewModel].
///
/// See the documentation for Mockito's code generation for more information.
class MockHeartRateCardViewModel extends _i1.Mock
    implements _i4.HeartRateCardViewModel {
  @override
  bool get contactStatus => (super.noSuchMethod(
        Invocation.getter(#contactStatus),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  set contactStatus(bool? _contactStatus) => super.noSuchMethod(
        Invocation.setter(
          #contactStatus,
          _contactStatus,
        ),
        returnValueForMissingStub: null,
      );
  @override
  Map<int, _i4.HeartRateMinMaxPrHour> get hourlyHeartRate =>
      (super.noSuchMethod(
        Invocation.getter(#hourlyHeartRate),
        returnValue: <int, _i4.HeartRateMinMaxPrHour>{},
        returnValueForMissingStub: <int, _i4.HeartRateMinMaxPrHour>{},
      ) as Map<int, _i4.HeartRateMinMaxPrHour>);
  @override
  _i4.HeartRateMinMaxPrHour get dayMinMax => (super.noSuchMethod(
        Invocation.getter(#dayMinMax),
        returnValue: _FakeHeartRateMinMaxPrHour_3(
          this,
          Invocation.getter(#dayMinMax),
        ),
        returnValueForMissingStub: _FakeHeartRateMinMaxPrHour_3(
          this,
          Invocation.getter(#dayMinMax),
        ),
      ) as _i4.HeartRateMinMaxPrHour);
  @override
  _i4.HourlyHeartRate get model => (super.noSuchMethod(
        Invocation.getter(#model),
        returnValue: _FakeHourlyHeartRate_4(
          this,
          Invocation.getter(#model),
        ),
        returnValueForMissingStub: _FakeHourlyHeartRate_4(
          this,
          Invocation.getter(#model),
        ),
      ) as _i4.HourlyHeartRate);
  @override
  _i5.Future<String> get filename => (super.noSuchMethod(
        Invocation.getter(#filename),
        returnValue: _i5.Future<String>.value(''),
        returnValueForMissingStub: _i5.Future<String>.value(''),
      ) as _i5.Future<String>);
  @override
  _i4.HourlyHeartRate createModel() => (super.noSuchMethod(
        Invocation.method(
          #createModel,
          [],
        ),
        returnValue: _FakeHourlyHeartRate_4(
          this,
          Invocation.method(
            #createModel,
            [],
          ),
        ),
        returnValueForMissingStub: _FakeHourlyHeartRate_4(
          this,
          Invocation.method(
            #createModel,
            [],
          ),
        ),
      ) as _i4.HourlyHeartRate);
  @override
  void init(_i2.SmartphoneDeploymentController? ctrl) => super.noSuchMethod(
        Invocation.method(
          #init,
          [ctrl],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i5.Future<bool> save(Map<String, dynamic>? json) => (super.noSuchMethod(
        Invocation.method(
          #save,
          [json],
        ),
        returnValue: _i5.Future<bool>.value(false),
        returnValueForMissingStub: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
  @override
  _i5.Future<bool> delete() => (super.noSuchMethod(
        Invocation.method(
          #delete,
          [],
        ),
        returnValue: _i5.Future<bool>.value(false),
        returnValueForMissingStub: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
  @override
  _i5.Future<_i4.HourlyHeartRate?> restore() => (super.noSuchMethod(
        Invocation.method(
          #restore,
          [],
        ),
        returnValue: _i5.Future<_i4.HourlyHeartRate?>.value(),
        returnValueForMissingStub: _i5.Future<_i4.HourlyHeartRate?>.value(),
      ) as _i5.Future<_i4.HourlyHeartRate?>);
}

/// A class which mocks [HourlyHeartRate].
///
/// See the documentation for Mockito's code generation for more information.
class MockHourlyHeartRate extends _i1.Mock implements _i4.HourlyHeartRate {
  @override
  Map<int, _i4.HeartRateMinMaxPrHour> get hourlyHeartRate =>
      (super.noSuchMethod(
        Invocation.getter(#hourlyHeartRate),
        returnValue: <int, _i4.HeartRateMinMaxPrHour>{},
        returnValueForMissingStub: <int, _i4.HeartRateMinMaxPrHour>{},
      ) as Map<int, _i4.HeartRateMinMaxPrHour>);
  @override
  set hourlyHeartRate(Map<int, _i4.HeartRateMinMaxPrHour>? _hourlyHeartRate) =>
      super.noSuchMethod(
        Invocation.setter(
          #hourlyHeartRate,
          _hourlyHeartRate,
        ),
        returnValueForMissingStub: null,
      );
  @override
  DateTime get lastUpdated => (super.noSuchMethod(
        Invocation.getter(#lastUpdated),
        returnValue: _FakeDateTime_5(
          this,
          Invocation.getter(#lastUpdated),
        ),
        returnValueForMissingStub: _FakeDateTime_5(
          this,
          Invocation.getter(#lastUpdated),
        ),
      ) as DateTime);
  @override
  set lastUpdated(DateTime? _lastUpdated) => super.noSuchMethod(
        Invocation.setter(
          #lastUpdated,
          _lastUpdated,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set currentHeartRate(double? _currentHeartRate) => super.noSuchMethod(
        Invocation.setter(
          #currentHeartRate,
          _currentHeartRate,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set maxHeartRate(double? _maxHeartRate) => super.noSuchMethod(
        Invocation.setter(
          #maxHeartRate,
          _maxHeartRate,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set minHeartRate(double? _minHeartRate) => super.noSuchMethod(
        Invocation.setter(
          #minHeartRate,
          _minHeartRate,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i4.HourlyHeartRate resetDataAtMidnight() => (super.noSuchMethod(
        Invocation.method(
          #resetDataAtMidnight,
          [],
        ),
        returnValue: _FakeHourlyHeartRate_4(
          this,
          Invocation.method(
            #resetDataAtMidnight,
            [],
          ),
        ),
        returnValueForMissingStub: _FakeHourlyHeartRate_4(
          this,
          Invocation.method(
            #resetDataAtMidnight,
            [],
          ),
        ),
      ) as _i4.HourlyHeartRate);
  @override
  _i4.HourlyHeartRate addHeartRate(
    int? hour,
    double? heartRate,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #addHeartRate,
          [
            hour,
            heartRate,
          ],
        ),
        returnValue: _FakeHourlyHeartRate_4(
          this,
          Invocation.method(
            #addHeartRate,
            [
              hour,
              heartRate,
            ],
          ),
        ),
        returnValueForMissingStub: _FakeHourlyHeartRate_4(
          this,
          Invocation.method(
            #addHeartRate,
            [
              hour,
              heartRate,
            ],
          ),
        ),
      ) as _i4.HourlyHeartRate);
  @override
  _i4.HourlyHeartRate fromJson(Map<String, dynamic>? json) =>
      (super.noSuchMethod(
        Invocation.method(
          #fromJson,
          [json],
        ),
        returnValue: _FakeHourlyHeartRate_4(
          this,
          Invocation.method(
            #fromJson,
            [json],
          ),
        ),
        returnValueForMissingStub: _FakeHourlyHeartRate_4(
          this,
          Invocation.method(
            #fromJson,
            [json],
          ),
        ),
      ) as _i4.HourlyHeartRate);
  @override
  Map<String, dynamic> toJson() => (super.noSuchMethod(
        Invocation.method(
          #toJson,
          [],
        ),
        returnValue: <String, dynamic>{},
        returnValueForMissingStub: <String, dynamic>{},
      ) as Map<String, dynamic>);
}

/// A class which mocks [PolarHR].
///
/// See the documentation for Mockito's code generation for more information.
class MockPolarHR extends _i1.Mock implements _i6.PolarHR {
  @override
  int get hr => (super.noSuchMethod(
        Invocation.getter(#hr),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);
  @override
  set hr(int? _hr) => super.noSuchMethod(
        Invocation.setter(
          #hr,
          _hr,
        ),
        returnValueForMissingStub: null,
      );
  @override
  List<int> get rrs => (super.noSuchMethod(
        Invocation.getter(#rrs),
        returnValue: <int>[],
        returnValueForMissingStub: <int>[],
      ) as List<int>);
  @override
  set rrs(List<int>? _rrs) => super.noSuchMethod(
        Invocation.setter(
          #rrs,
          _rrs,
        ),
        returnValueForMissingStub: null,
      );
  @override
  List<int> get rrsMs => (super.noSuchMethod(
        Invocation.getter(#rrsMs),
        returnValue: <int>[],
        returnValueForMissingStub: <int>[],
      ) as List<int>);
  @override
  set rrsMs(List<int>? _rrsMs) => super.noSuchMethod(
        Invocation.setter(
          #rrsMs,
          _rrsMs,
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool get contactStatus => (super.noSuchMethod(
        Invocation.getter(#contactStatus),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  set contactStatus(bool? _contactStatus) => super.noSuchMethod(
        Invocation.setter(
          #contactStatus,
          _contactStatus,
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool get contactStatusSupported => (super.noSuchMethod(
        Invocation.getter(#contactStatusSupported),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  set contactStatusSupported(bool? _contactStatusSupported) =>
      super.noSuchMethod(
        Invocation.setter(
          #contactStatusSupported,
          _contactStatusSupported,
        ),
        returnValueForMissingStub: null,
      );
  @override
  Function get fromJsonFunction => (super.noSuchMethod(
        Invocation.getter(#fromJsonFunction),
        returnValue: () {},
        returnValueForMissingStub: () {},
      ) as Function);
  @override
  String get jsonType => (super.noSuchMethod(
        Invocation.getter(#jsonType),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  String get deviceIdentifier => (super.noSuchMethod(
        Invocation.getter(#deviceIdentifier),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  set deviceIdentifier(String? _deviceIdentifier) => super.noSuchMethod(
        Invocation.setter(
          #deviceIdentifier,
          _deviceIdentifier,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set deviceTimestamp(int? _deviceTimestamp) => super.noSuchMethod(
        Invocation.setter(
          #deviceTimestamp,
          _deviceTimestamp,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set sensorSpecificData(_i3.Data? _sensorSpecificData) => super.noSuchMethod(
        Invocation.setter(
          #sensorSpecificData,
          _sensorSpecificData,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i3.DataType get format => (super.noSuchMethod(
        Invocation.getter(#format),
        returnValue: _FakeDataType_6(
          this,
          Invocation.getter(#format),
        ),
        returnValueForMissingStub: _FakeDataType_6(
          this,
          Invocation.getter(#format),
        ),
      ) as _i3.DataType);
  @override
  set $type(String? _$type) => super.noSuchMethod(
        Invocation.setter(
          #$type,
          _$type,
        ),
        returnValueForMissingStub: null,
      );
  @override
  Map<String, dynamic> toJson() => (super.noSuchMethod(
        Invocation.method(
          #toJson,
          [],
        ),
        returnValue: <String, dynamic>{},
        returnValueForMissingStub: <String, dynamic>{},
      ) as Map<String, dynamic>);
  @override
  bool equivalentTo(_i3.Data? other) => (super.noSuchMethod(
        Invocation.method(
          #equivalentTo,
          [other],
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
}

/// A class which mocks [Measurement].
///
/// See the documentation for Mockito's code generation for more information.
class MockMeasurement extends _i1.Mock implements _i3.Measurement {
  @override
  int get sensorStartTime => (super.noSuchMethod(
        Invocation.getter(#sensorStartTime),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);
  @override
  set sensorStartTime(int? _sensorStartTime) => super.noSuchMethod(
        Invocation.setter(
          #sensorStartTime,
          _sensorStartTime,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set sensorEndTime(int? _sensorEndTime) => super.noSuchMethod(
        Invocation.setter(
          #sensorEndTime,
          _sensorEndTime,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set taskControl(_i3.TaskControl? _taskControl) => super.noSuchMethod(
        Invocation.setter(
          #taskControl,
          _taskControl,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i3.Data get data => (super.noSuchMethod(
        Invocation.getter(#data),
        returnValue: _FakeData_1(
          this,
          Invocation.getter(#data),
        ),
        returnValueForMissingStub: _FakeData_1(
          this,
          Invocation.getter(#data),
        ),
      ) as _i3.Data);
  @override
  set data(_i3.Data? _data) => super.noSuchMethod(
        Invocation.setter(
          #data,
          _data,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i3.DataType get dataType => (super.noSuchMethod(
        Invocation.getter(#dataType),
        returnValue: _FakeDataType_6(
          this,
          Invocation.getter(#dataType),
        ),
        returnValueForMissingStub: _FakeDataType_6(
          this,
          Invocation.getter(#dataType),
        ),
      ) as _i3.DataType);
  @override
  Map<String, dynamic> toJson() => (super.noSuchMethod(
        Invocation.method(
          #toJson,
          [],
        ),
        returnValue: <String, dynamic>{},
        returnValueForMissingStub: <String, dynamic>{},
      ) as Map<String, dynamic>);
}

/// A class which mocks [DataModel].
///
/// See the documentation for Mockito's code generation for more information.
class MockDataModel extends _i1.Mock implements _i4.DataModel {
  @override
  _i4.DataModel fromJson(Map<String, dynamic>? json) => (super.noSuchMethod(
        Invocation.method(
          #fromJson,
          [json],
        ),
        returnValue: _FakeDataModel_7(
          this,
          Invocation.method(
            #fromJson,
            [json],
          ),
        ),
        returnValueForMissingStub: _FakeDataModel_7(
          this,
          Invocation.method(
            #fromJson,
            [json],
          ),
        ),
      ) as _i4.DataModel);
  @override
  Map<String, dynamic> toJson() => (super.noSuchMethod(
        Invocation.method(
          #toJson,
          [],
        ),
        returnValue: <String, dynamic>{},
        returnValueForMissingStub: <String, dynamic>{},
      ) as Map<String, dynamic>);
}
