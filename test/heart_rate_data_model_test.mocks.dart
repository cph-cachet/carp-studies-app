// Mocks generated by Mockito 5.3.2 from annotations
// in carp_study_app/test/heart_rate_data_model_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:carp_core/carp_core.dart' as _i3;
import 'package:carp_mobile_sensing/carp_mobile_sensing.dart' as _i2;
import 'package:carp_polar_package/carp_polar_package.dart' as _i7;
import 'package:carp_study_app/main.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:permission_handler/permission_handler.dart' as _i5;

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

class _FakeDatum_1 extends _i1.SmartFake implements _i2.Datum {
  _FakeDatum_1(
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

class _FakeStudyDeploymentStatus_3 extends _i1.SmartFake
    implements _i3.StudyDeploymentStatus {
  _FakeStudyDeploymentStatus_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeHeartRateMinMaxPrHour_4 extends _i1.SmartFake
    implements _i4.HeartRateMinMaxPrHour {
  _FakeHeartRateMinMaxPrHour_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeHourlyHeartRate_5 extends _i1.SmartFake
    implements _i4.HourlyHeartRate {
  _FakeHourlyHeartRate_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDataFormat_6 extends _i1.SmartFake implements _i3.DataFormat {
  _FakeDataFormat_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDateTime_7 extends _i1.SmartFake implements DateTime {
  _FakeDateTime_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDataPointHeader_8 extends _i1.SmartFake
    implements _i3.DataPointHeader {
  _FakeDataPointHeader_8(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDataModel_9 extends _i1.SmartFake implements _i4.DataModel {
  _FakeDataModel_9(
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
  set permissions(Map<_i5.Permission, _i5.PermissionStatus>? _permissions) =>
      super.noSuchMethod(
        Invocation.setter(
          #permissions,
          _permissions,
        ),
        returnValueForMissingStub: null,
      );
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
  _i2.DatumTransformer get transformer => (super.noSuchMethod(
        Invocation.getter(#transformer),
        returnValue: (_i2.Datum __p0) => _FakeDatum_1(
          this,
          Invocation.getter(#transformer),
        ),
        returnValueForMissingStub: (_i2.Datum __p0) => _FakeDatum_1(
          this,
          Invocation.getter(#transformer),
        ),
      ) as _i2.DatumTransformer);
  @override
  _i6.Stream<_i3.DataPoint> get data => (super.noSuchMethod(
        Invocation.getter(#data),
        returnValue: _i6.Stream<_i3.DataPoint>.empty(),
        returnValueForMissingStub: _i6.Stream<_i3.DataPoint>.empty(),
      ) as _i6.Stream<_i3.DataPoint>);
  @override
  int get samplingSize => (super.noSuchMethod(
        Invocation.getter(#samplingSize),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);
  @override
  _i6.Future<String?> get filename => (super.noSuchMethod(
        Invocation.getter(#filename),
        returnValue: _i6.Future<String?>.value(),
        returnValueForMissingStub: _i6.Future<String?>.value(),
      ) as _i6.Future<String?>);
  @override
  set deployment(_i3.MasterDeviceDeployment? _deployment) => super.noSuchMethod(
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
  _i3.StudyDeploymentStatus get deploymentStatus => (super.noSuchMethod(
        Invocation.getter(#deploymentStatus),
        returnValue: _FakeStudyDeploymentStatus_3(
          this,
          Invocation.getter(#deploymentStatus),
        ),
        returnValueForMissingStub: _FakeStudyDeploymentStatus_3(
          this,
          Invocation.getter(#deploymentStatus),
        ),
      ) as _i3.StudyDeploymentStatus);
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
  set device(_i3.MasterDeviceDescriptor? _device) => super.noSuchMethod(
        Invocation.setter(
          #device,
          _device,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i6.Stream<_i3.StudyStatus> get statusEvents => (super.noSuchMethod(
        Invocation.getter(#statusEvents),
        returnValue: _i6.Stream<_i3.StudyStatus>.empty(),
        returnValueForMissingStub: _i6.Stream<_i3.StudyStatus>.empty(),
      ) as _i6.Stream<_i3.StudyStatus>);
  @override
  _i3.StudyStatus get status => (super.noSuchMethod(
        Invocation.getter(#status),
        returnValue: _i3.StudyStatus.DeploymentNotStarted,
        returnValueForMissingStub: _i3.StudyStatus.DeploymentNotStarted,
      ) as _i3.StudyStatus);
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
  List<_i3.DeviceDescriptor> get remainingDevicesToRegister =>
      (super.noSuchMethod(
        Invocation.getter(#remainingDevicesToRegister),
        returnValue: <_i3.DeviceDescriptor>[],
        returnValueForMissingStub: <_i3.DeviceDescriptor>[],
      ) as List<_i3.DeviceDescriptor>);
  @override
  _i6.Stream<_i3.DataPoint> dataByType(String? type) => (super.noSuchMethod(
        Invocation.method(
          #dataByType,
          [type],
        ),
        returnValue: _i6.Stream<_i3.DataPoint>.empty(),
        returnValueForMissingStub: _i6.Stream<_i3.DataPoint>.empty(),
      ) as _i6.Stream<_i3.DataPoint>);
  @override
  _i6.Future<_i3.StudyStatus> tryDeployment({bool? useCached = true}) =>
      (super.noSuchMethod(
        Invocation.method(
          #tryDeployment,
          [],
          {#useCached: useCached},
        ),
        returnValue: _i6.Future<_i3.StudyStatus>.value(
            _i3.StudyStatus.DeploymentNotStarted),
        returnValueForMissingStub: _i6.Future<_i3.StudyStatus>.value(
            _i3.StudyStatus.DeploymentNotStarted),
      ) as _i6.Future<_i3.StudyStatus>);
  @override
  _i6.Future<bool> saveDeployment() => (super.noSuchMethod(
        Invocation.method(
          #saveDeployment,
          [],
        ),
        returnValue: _i6.Future<bool>.value(false),
        returnValueForMissingStub: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);
  @override
  _i6.Future<bool> restoreDeployment() => (super.noSuchMethod(
        Invocation.method(
          #restoreDeployment,
          [],
        ),
        returnValue: _i6.Future<bool>.value(false),
        returnValueForMissingStub: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);
  @override
  _i6.Future<bool> eraseDeployment() => (super.noSuchMethod(
        Invocation.method(
          #eraseDeployment,
          [],
        ),
        returnValue: _i6.Future<bool>.value(false),
        returnValueForMissingStub: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);
  @override
  _i6.Future<void> configure({
    _i3.DataEndPoint? dataEndPoint,
    String? privacySchemaName = r'dk.cachet.carp',
    _i2.DatumTransformer? transformer,
    bool? askForPermissions = true,
    bool? enableNotifications = true,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #configure,
          [],
          {
            #dataEndPoint: dataEndPoint,
            #privacySchemaName: privacySchemaName,
            #transformer: transformer,
            #askForPermissions: askForPermissions,
            #enableNotifications: enableNotifications,
          },
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<void> askForAllPermissions() => (super.noSuchMethod(
        Invocation.method(
          #askForAllPermissions,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  void start([bool? resume = true]) => super.noSuchMethod(
        Invocation.method(
          #start,
          [resume],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void stop() => super.noSuchMethod(
        Invocation.method(
          #stop,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i6.Future<void> initialize(
    _i3.Study? study,
    _i3.DeviceRegistration? deviceRegistration,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #initialize,
          [
            study,
            deviceRegistration,
          ],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<void> tryRegisterConnectedDevice(_i3.DeviceDescriptor? device) =>
      (super.noSuchMethod(
        Invocation.method(
          #tryRegisterConnectedDevice,
          [device],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<void> tryRegisterConnectedDevices() => (super.noSuchMethod(
        Invocation.method(
          #tryRegisterConnectedDevices,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
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
        returnValue: _FakeHeartRateMinMaxPrHour_4(
          this,
          Invocation.getter(#dayMinMax),
        ),
        returnValueForMissingStub: _FakeHeartRateMinMaxPrHour_4(
          this,
          Invocation.getter(#dayMinMax),
        ),
      ) as _i4.HeartRateMinMaxPrHour);
  @override
  _i4.HourlyHeartRate get model => (super.noSuchMethod(
        Invocation.getter(#model),
        returnValue: _FakeHourlyHeartRate_5(
          this,
          Invocation.getter(#model),
        ),
        returnValueForMissingStub: _FakeHourlyHeartRate_5(
          this,
          Invocation.getter(#model),
        ),
      ) as _i4.HourlyHeartRate);
  @override
  _i6.Future<String> get filename => (super.noSuchMethod(
        Invocation.getter(#filename),
        returnValue: _i6.Future<String>.value(''),
        returnValueForMissingStub: _i6.Future<String>.value(''),
      ) as _i6.Future<String>);
  @override
  _i4.HourlyHeartRate createModel() => (super.noSuchMethod(
        Invocation.method(
          #createModel,
          [],
        ),
        returnValue: _FakeHourlyHeartRate_5(
          this,
          Invocation.method(
            #createModel,
            [],
          ),
        ),
        returnValueForMissingStub: _FakeHourlyHeartRate_5(
          this,
          Invocation.method(
            #createModel,
            [],
          ),
        ),
      ) as _i4.HourlyHeartRate);
  @override
  void init(_i2.SmartphoneDeploymentController? controller) =>
      super.noSuchMethod(
        Invocation.method(
          #init,
          [controller],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i6.Future<bool> save(Map<String, dynamic>? json) => (super.noSuchMethod(
        Invocation.method(
          #save,
          [json],
        ),
        returnValue: _i6.Future<bool>.value(false),
        returnValueForMissingStub: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);
  @override
  _i6.Future<_i4.HourlyHeartRate?> restore() => (super.noSuchMethod(
        Invocation.method(
          #restore,
          [],
        ),
        returnValue: _i6.Future<_i4.HourlyHeartRate?>.value(),
        returnValueForMissingStub: _i6.Future<_i4.HourlyHeartRate?>.value(),
      ) as _i6.Future<_i4.HourlyHeartRate?>);
}

/// A class which mocks [PolarHRDatum].
///
/// See the documentation for Mockito's code generation for more information.
class MockPolarHRDatum extends _i1.Mock implements _i7.PolarHRDatum {
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
  _i3.DataFormat get format => (super.noSuchMethod(
        Invocation.getter(#format),
        returnValue: _FakeDataFormat_6(
          this,
          Invocation.getter(#format),
        ),
        returnValueForMissingStub: _FakeDataFormat_6(
          this,
          Invocation.getter(#format),
        ),
      ) as _i3.DataFormat);
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
  set id(String? _id) => super.noSuchMethod(
        Invocation.setter(
          #id,
          _id,
        ),
        returnValueForMissingStub: null,
      );
  @override
  DateTime get timestamp => (super.noSuchMethod(
        Invocation.getter(#timestamp),
        returnValue: _FakeDateTime_7(
          this,
          Invocation.getter(#timestamp),
        ),
        returnValueForMissingStub: _FakeDateTime_7(
          this,
          Invocation.getter(#timestamp),
        ),
      ) as DateTime);
  @override
  set timestamp(DateTime? _timestamp) => super.noSuchMethod(
        Invocation.setter(
          #timestamp,
          _timestamp,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set format(_i3.DataFormat? _format) => super.noSuchMethod(
        Invocation.setter(
          #format,
          _format,
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
  bool equivalentTo(_i2.ConditionalEvent? event) => (super.noSuchMethod(
        Invocation.method(
          #equivalentTo,
          [event],
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
}

/// A class which mocks [DataPoint].
///
/// See the documentation for Mockito's code generation for more information.
class MockDataPoint extends _i1.Mock implements _i3.DataPoint {
  @override
  set id(int? _id) => super.noSuchMethod(
        Invocation.setter(
          #id,
          _id,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set createdByUserId(int? _createdByUserId) => super.noSuchMethod(
        Invocation.setter(
          #createdByUserId,
          _createdByUserId,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set studyId(String? _studyId) => super.noSuchMethod(
        Invocation.setter(
          #studyId,
          _studyId,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i3.DataPointHeader get carpHeader => (super.noSuchMethod(
        Invocation.getter(#carpHeader),
        returnValue: _FakeDataPointHeader_8(
          this,
          Invocation.getter(#carpHeader),
        ),
        returnValueForMissingStub: _FakeDataPointHeader_8(
          this,
          Invocation.getter(#carpHeader),
        ),
      ) as _i3.DataPointHeader);
  @override
  set carpHeader(_i3.DataPointHeader? _carpHeader) => super.noSuchMethod(
        Invocation.setter(
          #carpHeader,
          _carpHeader,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set data(_i3.Data? _data) => super.noSuchMethod(
        Invocation.setter(
          #data,
          _data,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set carpBody(Map<String, dynamic>? data) => super.noSuchMethod(
        Invocation.setter(
          #carpBody,
          data,
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
}

/// A class which mocks [DataPointHeader].
///
/// See the documentation for Mockito's code generation for more information.
class MockDataPointHeader extends _i1.Mock implements _i3.DataPointHeader {
  @override
  set studyId(String? _studyId) => super.noSuchMethod(
        Invocation.setter(
          #studyId,
          _studyId,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set deviceRoleName(String? _deviceRoleName) => super.noSuchMethod(
        Invocation.setter(
          #deviceRoleName,
          _deviceRoleName,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set triggerId(String? _triggerId) => super.noSuchMethod(
        Invocation.setter(
          #triggerId,
          _triggerId,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set userId(String? _userId) => super.noSuchMethod(
        Invocation.setter(
          #userId,
          _userId,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set uploadTime(DateTime? _uploadTime) => super.noSuchMethod(
        Invocation.setter(
          #uploadTime,
          _uploadTime,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set startTime(DateTime? _startTime) => super.noSuchMethod(
        Invocation.setter(
          #startTime,
          _startTime,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set endTime(DateTime? _endTime) => super.noSuchMethod(
        Invocation.setter(
          #endTime,
          _endTime,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i3.DataFormat get dataFormat => (super.noSuchMethod(
        Invocation.getter(#dataFormat),
        returnValue: _FakeDataFormat_6(
          this,
          Invocation.getter(#dataFormat),
        ),
        returnValueForMissingStub: _FakeDataFormat_6(
          this,
          Invocation.getter(#dataFormat),
        ),
      ) as _i3.DataFormat);
  @override
  set dataFormat(_i3.DataFormat? _dataFormat) => super.noSuchMethod(
        Invocation.setter(
          #dataFormat,
          _dataFormat,
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
        returnValue: _FakeDateTime_7(
          this,
          Invocation.getter(#lastUpdated),
        ),
        returnValueForMissingStub: _FakeDateTime_7(
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
  void resetDataAtMidnight() => super.noSuchMethod(
        Invocation.method(
          #resetDataAtMidnight,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void addHeartRate(
    int? hour,
    double? heartRate,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #addHeartRate,
          [
            hour,
            heartRate,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i4.HourlyHeartRate fromJson(Map<String, dynamic>? json) =>
      (super.noSuchMethod(
        Invocation.method(
          #fromJson,
          [json],
        ),
        returnValue: _FakeHourlyHeartRate_5(
          this,
          Invocation.method(
            #fromJson,
            [json],
          ),
        ),
        returnValueForMissingStub: _FakeHourlyHeartRate_5(
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
        returnValue: _FakeDataModel_9(
          this,
          Invocation.method(
            #fromJson,
            [json],
          ),
        ),
        returnValueForMissingStub: _FakeDataModel_9(
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