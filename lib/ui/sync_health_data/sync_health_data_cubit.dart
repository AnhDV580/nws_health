import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:health/health.dart';
import 'package:rxdart/rxdart.dart';

import '../../models/enums/load_status.dart';
import '../../models/enums/sync_state_enum.dart';

part 'sync_health_data_state.dart';

class SyncHealthDataCubit extends Cubit<SyncHealthDataState> {
  String tag = 'SyncHealthDataCubit';

  HealthFactory health = HealthFactory();
  List<HealthDataType> _healthDataTypes = [
    HealthDataType.BASAL_ENERGY_BURNED,
    HealthDataType.STEPS,
    HealthDataType.HEIGHT,
    HealthDataType.WEIGHT,
    HealthDataType.BODY_FAT_PERCENTAGE,
    HealthDataType.ACTIVE_ENERGY_BURNED,
  ];

  SyncHealthDataCubit() : super(SyncHealthDataState());

  final requestActivityRecognitionPermissionController = PublishSubject<bool>();

  @override
  Future<void> close() {
    requestActivityRecognitionPermissionController.close();
    return super.close();
  }

  void initData() async {
    // try {
    //   final result = await userRepository.getUserProfile();
    //   if (result.success != null && result.data != null) {
    //     emit(state.copyWith(userEntity: result?.data));
    //   }
    // } catch (e) {
    //   emit(state.copyWith(message: e.toString()));
    // }
  }

  // Future<void> syncHealthData() async {
  //   emit(state.copyWith(syncHealthDataStatus: LoadStatus.LOADING));
  //   try {
  //     final preference = await Preferences.getInstance();
  //
  //     /// Xin cap quyen access Physical activity -> Lay data step tu Google Fit
  //     if (Platform.isAndroid) {
  //       try {
  //         var _permissionActivityRecognition =
  //             await Permission.activityRecognition.status;
  //         if (_permissionActivityRecognition != PermissionStatus.granted) {
  //           final permissionStatus =
  //               await Permission.activityRecognition.request();
  //           if (permissionStatus != PermissionStatus.granted) {
  //             requestActivityRecognitionPermissionController.sink.add(true);
  //             emit(state.copyWith(syncHealthDataStatus: LoadStatus.FAILURE));
  //             return;
  //           }
  //         }
  //       } catch (error) {
  //         // logger.e("$tag - onChangeAsyncDevice(): " + error.toString());
  //       }
  //     }
  //
  //     /// Request Google authorization
  //     bool requested = await health.requestAuthorization(_healthDataTypes);
  //     if (requested != null && requested) {
  //       DateTime dateTime = DateTime.now();
  //       print('Approve request');
  //
  //       /// Dong bo health data trong ngay
  //       var currentTimeOfDate = dateTime;
  //       var startTimeOfDate =
  //           DateTime(dateTime.year, dateTime.month, dateTime.day);
  //       List<HealthDataPoint> healthDataOneDay =
  //           await health.getHealthDataFromTypes(
  //         startTimeOfDate,
  //         currentTimeOfDate,
  //         _healthDataTypes,
  //       );
  //       print(healthDataOneDay);
  //
  //       /// Gui health data len foodcoach server
  //       if (healthDataOneDay.length == 0) {
  //         // Khong co health data
  //         print('Health Data is Empty');
  //         emit(state.copyWith(syncStateEnum: SyncStateEnum.ERROR_OR_NO_DATA));
  //       } else {
  //         var temporaryDate = healthDataOneDay[0].dateFrom;
  //         await addHealthDataToServer(
  //           date: DateFormat(AppConfig.dateFormat).format(temporaryDate),
  //           healthData: healthDataOneDay,
  //         );
  //
  //         /// Da dong bo thanh cong
  //         GlobalEvent.instance.reloadCalendarController.sink.add(true);
  //         GlobalEvent.instance.reloadHomePageController.sink.add(true);
  //       }
  //
  //       await preference.setCollectedDevice(true);
  //       await preference.setEmailAsyncDevice(state?.userEntity?.username ?? "");
  //       emit(state.copyWith(syncHealthDataStatus: LoadStatus.SUCCESS));
  //     } else {
  //       emit(state.copyWith(
  //           syncHealthDataStatus: LoadStatus.SUCCESS,
  //           syncStateEnum: SyncStateEnum.ERROR_OR_NO_DATA));
  //     }
  //   } catch (e) {
  //     emit(state.copyWith(
  //         syncStateEnum: SyncStateEnum.ERROR_OR_NO_DATA,
  //         syncHealthDataStatus: LoadStatus.SUCCESS));
  //   }
  // }
  //
  // Future<void> addHealthDataToServer({
  //   String date,
  //   List<HealthDataPoint> healthData,
  // }) async {
  //   emit(state.copyWith(sendHealthDataToServerStatus: LoadStatus.LOADING));
  //   final preferences = await Preferences.getInstance();
  //   final accessToken = preferences.getAccessToken();
  //   final source = Platform.isIOS ? "0" : "1";
  //
  //   ///Hiện tại Package Health đang không hỗ trợ lấy được trao đổi chất cơ bản bên android;
  //   var basalEnergyBurned = 0.0;
  //   var stepCount = 0.0;
  //   var height = 0.0;
  //   var bodyMass = 0.0;
  //   var bodyFatPercentage = 0.0;
  //   var activeEnergyBurned = 0.0;
  //
  //   var countHeight = 0;
  //   var countBodyMass = 0;
  //   var countBodyFatPercentage = 0;
  //
  //   if (healthData.length > 0) {
  //     /// Truong hop neu health data trong 1 ngay co:
  //     /// Nhieu data ve stepCount -> Tinh tong (Don vi: so buoc chan)
  //     /// Nhieu data ve height -> Tinh trung binh cong (Don vi: cm)
  //     /// Nhieu data ve bodyMass -> Tinh trung binh cong (Don vi: kg)
  //     /// Nhieu data ve bodyFatPercentage -> Tinh trung binh cong (Don vi: %)
  //     /// Nhieu data ve activeEnergyBurned -> Tinh tong (Don vi calories)
  //     /// Nhieu data ve basalEnergyBurned -> Tinh tong (Don vi calories)
  //
  //     for (int i = 0; i < healthData.length; i++) {
  //       if (healthData[i].type == HealthDataType.STEPS) {
  //         stepCount += healthData[i].value ?? 0.0;
  //       } else if (healthData[i].type == HealthDataType.HEIGHT) {
  //         countHeight += 1;
  //         height += (healthData[i].value * 100) ?? 0.0;
  //       } else if (healthData[i].type == HealthDataType.WEIGHT) {
  //         countBodyMass += 1;
  //         bodyMass += healthData[i].value ?? 0.0;
  //       } else if (healthData[i].type == HealthDataType.BODY_FAT_PERCENTAGE) {
  //         countBodyFatPercentage += 1;
  //         bodyFatPercentage += (Platform.isIOS
  //                 ? healthData[i].value * 100
  //                 : healthData[i].value) ??
  //             0.0;
  //       } else if (healthData[i].type == HealthDataType.ACTIVE_ENERGY_BURNED) {
  //         activeEnergyBurned += healthData[i].value ?? 0.0;
  //       } else if (healthData[i].type == HealthDataType.BASAL_ENERGY_BURNED) {
  //         basalEnergyBurned += healthData[i].value ?? 0.0;
  //       }
  //     }
  //     height = countHeight > 0
  //         ? (height / countHeight)
  //         : 0.0; // Tinh trung binh cong chieu cao 1 ngay
  //     bodyMass = countBodyMass > 0
  //         ? (bodyMass / countBodyMass)
  //         : 0.0; // Tinh trung binh cong khoi luong cua 1 ngay
  //     bodyFatPercentage = countBodyFatPercentage > 0
  //         ? (bodyFatPercentage / countBodyFatPercentage)
  //         : 0.0; // Tinh trung binh cong phan tram mo cua 1 ngay
  //   }
  //
  //   try {
  //     final param = HealthCareParam.fromBody(
  //       accessToken: accessToken,
  //       date: date ?? DateFormat(AppConfig.dateFormat).format(DateTime.now()),
  //       source: source,
  //       basalEnergyBurned:
  //           basalEnergyBurned == 0.0 ? "0" : basalEnergyBurned.toString(),
  //       stepCount: stepCount == 0.0 ? "0" : stepCount.toString(),
  //       height: height == 0.0 ? "0" : height.toString(),
  //       bodyMass: bodyMass == 0.0 ? "0" : bodyMass.toString(),
  //       bodyFatPercentage:
  //           bodyFatPercentage == 0.0 ? "0" : bodyFatPercentage.toString(),
  //       activeEnergyBurned:
  //           activeEnergyBurned == 0.0 ? "0" : activeEnergyBurned.toString(),
  //     );
  //
  //     final result =
  //         await healthcareRepository.addHealthcareData(healthcareData: param);
  //
  //     if (result.isSuccess) {
  //       logger.d("$tag - addHealthDataToServer: success " + date);
  //       emit(state.copyWith(
  //           sendHealthDataToServerStatus: LoadStatus.SUCCESS,
  //           healthData: param,
  //           syncStateEnum: SyncStateEnum.HAVE_DATA));
  //     } else {
  //       logger.e("$tag - addHealthDataToServer(): error ");
  //       emit(state.copyWith(sendHealthDataToServerStatus: LoadStatus.FAILURE));
  //     }
  //   } catch (e) {
  //     logger.e("$tag - addHealthDataToServer(): " + e.toString());
  //     emit(state.copyWith(sendHealthDataToServerStatus: LoadStatus.FAILURE));
  //   }
  // }
}
