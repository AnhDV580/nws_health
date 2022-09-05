class AppConfig {
  static const String appName = 'NEWWAVE HEALTH';

  ///Environment Config

  ///Network

  ///Paging
  static const pageSize = 40;
  static const pageSizeMax = 1000;

  ///Local
  static const appLocal = 'ja_JP';
  static const dateFormat = 'yyyy-MM-dd';
  static const birthdayFormat = 'yyyy/MM/dd';
  static const dateTimeFormat = 'yyyy-MM-dd HH:mm:ss';
  static const dateTimeZeroFormat = 'yyyy-MM-dd 00:00:00';

  ///Date
  static const yearOfBirthDefault = 1990;
  static const monthOfBirthDefault = 1;
  static const dayOfBirthDefault = 1;

  ///Picker
  static const int minAge = 10;
  static const int maxAge = 10;
  static const double minFatPercent = 0; //%
  static const double maxFatPercent = 50; //%
  static const double stepFatPercent = 0.5; //%
  static const double minWeight = 20; //kg
  static const double maxWeight = 150; //kg
  static const double stepWeight = 0.5; //kg
  static const double minHeight = 120; //cm
  static const double maxHeight = 220; //cm
  static const double stepHeight = 1; //cm
  static const double minTargetWeight = 20; //kg
  static const double maxTargetWeight = 150; //kg
  static const double stepTargetWeight = 0.5; //kg
  static const double minTargetFatPercent = 0; //%
  static const double maxTargetFatPercent = 50; //%
  static const double stepTargetFatPercent = 0.5; //%
  static const double minWeightChange = 1; //%
  static const double maxWeightChange = 21; //%
  static const double minTrainingTime = 1;
  static const double maxTrainingTime = 20;
  static const double stepTrainingTime = 1;
  static const double minQuantities = 0;
  static const double maxQuantities = 5;
  static const int minVideoQuantities = 1;
  static const int maxVideoQuantities = 5;
  static const int stepVideoQuantities = 1;
}

class FirebaseConfig {
  //Todo
}

class DatabaseConfig {
  //Todo
  static const int version = 1;
}
