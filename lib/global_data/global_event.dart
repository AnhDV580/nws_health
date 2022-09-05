import 'dart:async';

class GlobalEvent {

  GlobalEvent._privateConstructor();

  static final GlobalEvent instance = GlobalEvent._privateConstructor();

  // ignore: close_sinks
  final onTokenExpired = StreamController<bool>.broadcast();

  //Reload home
  final reloadHomePageController = StreamController<bool>.broadcast();

  final changeMainTab = StreamController<int>.broadcast();

  final submitMealRegistrationController = StreamController<bool>.broadcast();

  //Reload calendar
  final reloadCalendarController = StreamController<bool>.broadcast();

  //Reload detail day
  final reloadDetailDayController = StreamController<bool>.broadcast();

  final changeGoalController = StreamController<bool>.broadcast();


}
