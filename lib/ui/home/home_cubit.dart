import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health/health.dart';
import 'package:rxdart/subjects.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  String tag = "HomeCubit";
  final loadStatusSuccessController = PublishSubject<String>();

  HealthFactory health = HealthFactory();

  List<HealthDataType> _healthDataTypes = [
    HealthDataType.BASAL_ENERGY_BURNED,
    HealthDataType.STEPS,
    HealthDataType.HEIGHT,
    HealthDataType.WEIGHT,
    HealthDataType.BODY_FAT_PERCENTAGE,
    HealthDataType.ACTIVE_ENERGY_BURNED,
  ];

  HomeCubit() : super(HomeState());

  final requestActivityRecognitionPermissionController = PublishSubject<bool>();

  @override
  Future<void> close() {
    requestActivityRecognitionPermissionController.close();
    loadStatusSuccessController.close();
    return super.close();
  }

  Future<void> getHealthCareData() async {
    // final preference = await Preferences.getInstance();
    // final isAsync = preference.getCollectedDevice() ?? false;
    // bool collected = false;
    //
    // await initUserData();
    //
    // final getEmailAsync = preference.getEmailAsyncDevice() ?? "";
    // final userEmail = state?.userEntity?.username ?? "";
    //
    // if (getEmailAsync.isNotEmpty && userEmail == getEmailAsync && isAsync) {
    //   collected = true;
    // }

    // if (collected) {
    //   /// Đồng bộ dữ liệu sức khỏe trong vòng 6 ngày cho tới giờ
    //   List<List<HealthDataPoint>> healthDataAllDays =
    //       await HealthDataUtils.getHealthDataAllDays(health, _healthDataTypes);
    //
    //   if (healthDataAllDays != null && healthDataAllDays.length > 0) {
    //     var count = 0;
    //     while (count < healthDataAllDays.length) {
    //       if (healthDataAllDays[count].length == 0) {
    //         count += 1;
    //         continue;
    //       }
    //       var temporaryDate = healthDataAllDays[count][0].dateFrom;
    //       await addHealthDataToServer(
    //         date: DateFormat(AppConfig.dateFormat).format(temporaryDate),
    //         healthData: healthDataAllDays[count],
    //       );
    //       count += 1;
    //     }
    //     emit(state.copyWith(addHealthDataStatus: LoadStatus.SUCCESS));
    //   } else {
    //     print('Health Data is Empty');
    //   }
    // }
  }
  //
  // Future<void> checkConnectionHealthData() async {
  //   final preference = await Preferences.getInstance();
  //   final isAsync = preference.getCollectedDevice() ?? false;
  //   bool isConnected = false;
  //
  //   await initUserData();
  //
  //   final getEmailAsync = preference.getEmailAsyncDevice() ?? "";
  //   final userEmail = state?.userEntity?.username ?? "";
  //
  //   if (getEmailAsync.isNotEmpty && userEmail == getEmailAsync && isAsync) {
  //     isConnected = true;
  //   }
  //   emit(state.copyWith(isConnectedHealthData: isConnected));
  //   return isConnected;
  // }
  //
  // Future<void> initUserData() async {
  //   emit(state.copyWith(addHealthDataStatus: LoadStatus.LOADING));
  //   try {
  //     final result = await userRepository.getUserProfile();
  //
  //     if (result.success != null && result.data != null) {
  //       emit(state.copyWith(
  //         userEntity: result?.data,
  //         addHealthDataStatus: LoadStatus.SUCCESS,
  //       ));
  //     } else {
  //       logger.e('Invalid return data');
  //       emit(state.copyWith(addHealthDataStatus: LoadStatus.FAILURE));
  //     }
  //   } catch (e) {
  //     print(e);
  //     emit(state.copyWith(addHealthDataStatus: LoadStatus.FAILURE));
  //   }
  // }
  //
  // void toggleDatePicker() {
  //   final isShowing = state.isShowDatePicker;
  //   emit(state.copyWith(isShowDatePicker: !isShowing));
  // }
  //
  // void getStatusDetail({bool isUpdateProfile}) async {
  //   try {
  //     emit(state.copyWith(getStatusDetailStatus: LoadStatus.LOADING));
  //     final result = await statusRepository
  //         .statusDetail(StatusDetailParam(statusId: state.statusID));
  //     if (result.isSuccess) {
  //       if (result.data.dtGoalEnd == "") {
  //         emit(state.copyWith(getStatusDetailStatus: LoadStatus.FAILURE));
  //         loadStatusSuccessController.sink
  //             .add("目標が未設定です。\n 目標を設定しますか？"); // If no goal is set
  //       } else {
  //         var _split = result.data.dtGoalEnd.split("-"); //2020-12-31
  //         DateTime _dateGoalEnd = DateTime(int.tryParse(_split[0]),
  //             int.tryParse(_split[1]), int.tryParse(_split[2]));
  //         if (_dateGoalEnd.difference(DateTime.now()) < Duration(days: 0)) {
  //           emit(state.copyWith(getStatusDetailStatus: LoadStatus.FAILURE));
  //           loadStatusSuccessController.sink.add(
  //               "目標期日を過ぎました。\n 新しい目標を設定しますか？"); // If the target date has passed
  //         } else {
  //           if (isUpdateProfile != null && !isUpdateProfile) {
  //             emit(state.copyWith(isNavigateTargetPage: true));
  //           }
  //           emit(state.copyWith(
  //             getStatusDetailStatus: LoadStatus.SUCCESS,
  //             userStatusEntity: result.data,
  //           ));
  //         }
  //       }
  //     } else {
  //       emit(state.copyWith(getStatusDetailStatus: LoadStatus.FAILURE));
  //     }
  //   } catch (error) {
  //     logger.e("$tag - getStatusDetail(): " + error.toString());
  //     emit(state.copyWith(getStatusDetailStatus: LoadStatus.FAILURE));
  //   }
  // }
  //
  // void changingNavigate() {
  //   emit(state.copyWith(isNavigateTargetPage: false));
  // }
  //
  // void changeSelectedDateTime(DateTime dateTime) {
  //   emit(state.copyWith(selectedDateTime: dateTime));
  // }
  //
  // Future<void> loadActivityDetail(
  //     {bool isDelayToFetchLargeData = false,
  //     bool isOpenTargetView = false,
  //     bool isGetHealthDataWhenAppStart = false}) async {
  //   final dateString =
  //       DateFormat(AppConfig.dateFormat).format(state.selectedDateTime);
  //   emit(state.copyWith(
  //       loadActivityStatus: LoadStatus.LOADING, activities: List()));
  //   try {
  //     /// Get health care data and send to Food coach server
  //     if (isGetHealthDataWhenAppStart) await getHealthCareData();
  //
  //     /// Get data from Food coach server to display activities by day
  //     if (isDelayToFetchLargeData) await Future.delayed(Duration(seconds: 3));
  //     final result =
  //         await activityRepository.getActivityDetailByDay(dateString);
  //     final wearableData =
  //         await wearableRepository.getWearableData(state.selectedDateTime);
  //
  //     if (result.isSuccess && result.data != null) {
  //       List<ActivityEntity> _activities = result?.data ?? [];
  //
  //       /// Get list meals registered by day
  //       var _listMeals = HomePageUtils.getListActivityMeal(_activities);
  //       _listMeals.sort((a, b) => DateFormat(AppConfig.dateTimeFormat)
  //           .parse(a.date)
  //           .compareTo(DateFormat(AppConfig.dateTimeFormat).parse(b.date)));
  //
  //       /// Get list training activities registered by day
  //       var _listTrainings = HomePageUtils.getListActivityTraining(_activities);
  //
  //       /// Get list videos registered by day
  //       var _listActivityVideo =
  //           HomePageUtils.getListActivityVideo(_activities);
  //
  //       /// Get list status
  //       var _listStatus = HomePageUtils.getListActivityStatus(_activities);
  //
  //       var _listVideos = await _getListTrainingVideo(
  //         listActivityEntity: _listActivityVideo,
  //       );
  //       await getTotalInfo(_listTrainings);
  //
  //       print(_listVideos);
  //
  //       var _now = DateTime.now();
  //       var _selectedDateTime = DateTime(state.selectedDateTime.year,
  //           state.selectedDateTime.month, state.selectedDateTime.day);
  //       var _currentDate = DateTime(_now.year, _now.month, _now.day);
  //       if (_selectedDateTime.difference(_currentDate).inDays == 0)
  //         emit(state.copyWith(statusID: _listStatus.first.id));
  //       if (isOpenTargetView) getStatusDetail(isUpdateProfile: true);
  //
  //       if (wearableData.data != null && wearableData.returnCode != "86000") {
  //         emit(state.copyWith(
  //           activities: result.data,
  //           wearableData: wearableData.data,
  //           listVideos: _listVideos,
  //           listMeals: _listMeals,
  //           listTrainings: _listTrainings,
  //           listStatus: _listStatus,
  //           //trainingTimeVideo: trainingTime,
  //           loadActivityStatus: LoadStatus.SUCCESS,
  //         ));
  //       } else {
  //         WearableDataEntity wearData = WearableDataEntity(
  //             date: "", caloriesSum: 0, outOfDate: 0, stepSum: 0);
  //         emit(state.copyWith(
  //           activities: result.data,
  //           wearableData: wearData,
  //           listVideos: _listVideos,
  //           listMeals: _listMeals,
  //           listTrainings: _listTrainings,
  //           listStatus: _listStatus,
  //           //trainingTimeVideo: trainingTime,
  //           loadActivityStatus: LoadStatus.SUCCESS,
  //         ));
  //       }
  //     } else {
  //       logger.e("$tag - loadActivityDetail() ");
  //       emit(state.copyWith(
  //           listMeals: [],
  //           listStatus: [],
  //           listTrainings: [],
  //           listVideos: [],
  //           loadActivityStatus: LoadStatus.FAILURE));
  //     }
  //   } catch (error) {
  //     logger.e("$tag - loadActivityDetail(): " + error.toString());
  //     emit(state.copyWith(loadActivityStatus: LoadStatus.FAILURE));
  //   }
  // }
  //
  // Future<List<TrainingEntity>> _getListTrainingVideo({
  //   List<ActivityEntity> listActivityEntity,
  // }) async {
  //   List<TrainingEntity> result = List();
  //   if (listActivityEntity == null || listActivityEntity.isEmpty) {
  //     logger.e(
  //         "$tag - _getListTrainingVideo(): List activity is null or is Empty");
  //   } else {
  //     for (var activity in listActivityEntity) {
  //       VideoInfoEntity videoInfoEntity;
  //
  //       ///Get video info New - Not from Onkyo App
  //
  //       if (activity.info != null && activity.info.length > 0) {
  //         if (activity.info.first.timeTrainings != null &&
  //             activity.info.first.timeTrainings.length > 0) {
  //           if (activity.info.first.timeTrainings.first.videoId != null) {
  //             videoInfoEntity = VideoInfoEntity(
  //               id: activity.info.first.timeTrainings.first.videoId,
  //               title: activity.info.first.timeTrainings.first.videoTitle,
  //               duration: activity.info.first.timeTrainings.first.videoDuration,
  //               isFavourite: activity.info.first.timeTrainings.first.isFavorite,
  //               met: activity.info.first.timeTrainings.first.videoMet,
  //               videoUrl: activity.info.first.timeTrainings.first.videoUrl,
  //               trainingCode: activity.info.first.timeTrainings.first.code,
  //               thumbnail:
  //                   activity.info.first.timeTrainings.first.videoThumbnail,
  //             );
  //
  //             TrainingEntity _training = TrainingEntity(
  //               videoInfoEntity: videoInfoEntity,
  //               trainingId: activity.id,
  //               dateBegin:
  //                   DateFormat("yyyy-MM-dd 00:00:00").format(DateTime.now()),
  //               consumption:
  //                   (activity.info.first.consumption ?? 0.0).toStringAsFixed(0),
  //               timeTrainings: activity.info.first.timeTrainings,
  //               setTraining: activity.info.first.timeTrainings.first.value,
  //             );
  //             result.add(_training);
  //           }
  //         }
  //       }
  //     }
  //   }
  //   return result;
  // }
  //
  // Future<void> getTotalInfo(List<ActivityEntity> list) async {
  //   double totalConsumption = 0;
  //   double totalTimeTraining = 0;
  //   if (list.length > 0 && list != null) {
  //     list.forEach((element) {
  //       var _consumption = element.info.first.consumption;
  //       totalConsumption += _consumption == null
  //           ? 0
  //           : double.tryParse(_consumption.toStringAsFixed(1));
  //       totalTimeTraining +=
  //           double.tryParse(element.info.first.timeTrainings.first.value) ?? 0;
  //     });
  //     return emit(state.copyWith(
  //         sumConsumtion: totalConsumption, sumTimeTraining: totalTimeTraining));
  //   } else {
  //     return emit(state.copyWith(sumConsumtion: 0, sumTimeTraining: 0.0));
  //   }
  // }
  //
  // void closeStatusDetail() {
  //   emit(state.copyWith(getStatusDetailStatus: LoadStatus.INITIAL));
  // }
  //
  // Future<ActivityEntity> checkMealTypeRegistered(MealType mealType) async {
  //   var mealTypeName = MealTypeExtension.getNameByMealType(mealType);
  //   try {
  //     ActivityEntity result;
  //     for (ActivityEntity activity in state.listMeals) {
  //       if (activity.name == mealTypeName && activity.name != "snack") {
  //         result = activity;
  //         break;
  //       }
  //     }
  //     return result;
  //   } catch (error) {
  //     logger.e("$tag - checkMealTypeRegistered(): " + error.toString());
  //     return null;
  //   }
  // }
  //
  // ///Synchronized GoogleFit/ Apple HealthCare
  // void syncHealthData() async {
  //   emit(state.copyWith(onAsyncStatus: LoadStatus.LOADING));
  //   try {
  //     final preference = await Preferences.getInstance();
  //
  //     bool isAsyncDevice = state?.isConnectedHealthData ?? false;
  //     if (!isAsyncDevice) {
  //       /// Xin cap quyen access Physical activity -> Lay data step tu Google Fit
  //       if (Platform.isAndroid) {
  //         try {
  //           var _permissionActivityRecognition =
  //               await Permission.activityRecognition.status;
  //           if (_permissionActivityRecognition != PermissionStatus.granted) {
  //             final permissionStatus =
  //                 await Permission.activityRecognition.request();
  //             if (permissionStatus != PermissionStatus.granted) {
  //               requestActivityRecognitionPermissionController.sink.add(true);
  //               return;
  //             }
  //           }
  //         } catch (error) {
  //           logger.e("$tag - onChangeAsyncDevice(): " + error.toString());
  //         }
  //       }
  //
  //       /// Request Google authorization
  //       bool requested = await health.requestAuthorization(_healthDataTypes);
  //       if (requested != null && requested) {
  //         print('Approve request');
  //
  //         /// Đồng bộ dữ liệu sức khỏe trong vòng 6 ngày cho tới giờ
  //         List<List<HealthDataPoint>> healthDataAllDays =
  //             await HealthDataUtils.getHealthDataAllDays(
  //                 health, _healthDataTypes);
  //
  //         if (healthDataAllDays != null && healthDataAllDays.length > 0) {
  //           var count = 0;
  //
  //           /// Chay vong lap 7 lan de lay gui health data cua tung ngay
  //           while (count < healthDataAllDays.length) {
  //             /// Truong hop ngay do khong co health data
  //             if (healthDataAllDays[count].length == 0) {
  //               count += 1;
  //               continue;
  //             }
  //
  //             /// Truong hop ngay do co health data
  //             var temporaryDate = healthDataAllDays[count][0].dateFrom;
  //             await addHealthDataToServer(
  //               date: DateFormat(AppConfig.dateFormat).format(temporaryDate),
  //               healthData: healthDataAllDays[count],
  //             );
  //             count += 1;
  //           }
  //
  //           /// Da dong bo thanh cong
  //           GlobalEvent.instance.reloadCalendarController.sink.add(true);
  //           GlobalEvent.instance.reloadHomePageController.sink.add(true);
  //           emit(state.copyWith(
  //               message: '完了しました！', addHealthDataStatus: LoadStatus.SUCCESS));
  //         } else {
  //           print('Health Data is Empty');
  //         }
  //
  //         await preference.setCollectedDevice(true);
  //         await preference
  //             .setEmailAsyncDevice(state?.userEntity?.username ?? "");
  //
  //         final isChecked = preference.getCollectedDevice() ?? true;
  //         emit(state.copyWith(
  //             isConnectedHealthData: isChecked,
  //             onAsyncStatus: LoadStatus.SUCCESS));
  //       } else {
  //         emit(state.copyWith(onAsyncStatus: LoadStatus.SUCCESS));
  //       }
  //     }
  //   } catch (e) {
  //     logger.e(tag + " syncHealthData(): " + e.toString());
  //     emit(state.copyWith(
  //         message: '同期設定できませんでした。', onAsyncStatus: LoadStatus.FAILURE));
  //   }
  // }
  //
  // Future<void> addHealthDataToServer({
  //   String date,
  //   List<HealthDataPoint> healthData,
  // }) async {
  //   emit(state.copyWith(addHealthDataStatus: LoadStatus.LOADING));
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
  //     } else {
  //       logger.e("$tag - addHealthDataToServer(): error ");
  //       emit(state.copyWith(addHealthDataStatus: LoadStatus.FAILURE));
  //     }
  //   } catch (e) {
  //     logger.e("$tag - addHealthDataToServer(): " + e.toString());
  //     emit(state.copyWith(addHealthDataStatus: LoadStatus.FAILURE));
  //   }
  // }
}
