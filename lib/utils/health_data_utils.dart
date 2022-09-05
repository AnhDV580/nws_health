import 'package:health/health.dart';
import 'package:intl/intl.dart';
import 'package:newwave_health/configs/app_config.dart';

class HealthDataUtils {
  static Future<List<List<HealthDataPoint>>> getHealthDataAllDays(
      HealthFactory health, List<HealthDataType> healthDataTypes) async {
    List<List<HealthDataPoint>> healthDataAllDays = <List<HealthDataPoint>>[];
    var numberOfDays = 0;
    DateTime startDate = DateTime.tryParse(
        DateFormat(AppConfig.dateTimeZeroFormat).format(DateTime.now()));
    DateTime endDate = DateTime.now();

    while (numberOfDays < 7) {
      if (numberOfDays > 0) {
        endDate = startDate;
        startDate = startDate.subtract(Duration(days: 1));
      }

      List<HealthDataPoint> healthDataOneDay = await health
          .getHealthDataFromTypes(startDate, endDate, healthDataTypes);
      healthDataAllDays.add(healthDataOneDay);
      numberOfDays += 1;
    }
    print(healthDataAllDays);
    return healthDataAllDays;
  }
}
