import 'package:fluro/fluro.dart';
import 'package:newwave_health/router/root_handler.dart';

class Routes {
  static String root = "/";
  static String syncHealthDataResult = "/sync_health_data_result_page";

  static void configureRoutes(FluroRouter router) {
    router.define(root, handler: rootHandler);
  }
}
