import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:newwave_health/ui/home/home_page.dart';

var notFoundHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return Container(
    child: Center(
      child: Text('Not found'),
    ),
  );
});

var rootHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return HomePage();
});

// var mainHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   DateTime _currentDate = DateTime.parse(params['date']?.first);
//   return BlocProvider(
//     create: (context) {
//       return MainCubit();
//     },
//     child: MainPage(
//         dateTime:
//             DateTime(_currentDate.year, _currentDate.month, _currentDate.day)),
//   );
// });
//
// var homeHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   DateTime _currentDate = DateTime.parse(params['date']?.first);
//   return MainPage(
//       dateTime:
//           DateTime(_currentDate.year, _currentDate.month, _currentDate.day));
// });

// var syncHealthDataResultHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   SyncHealthDataResultArgument args = context.settings.arguments;
//   return SyncHealthDataResultPage(
//     context: args?.context,
//     healthData: args?.healthData,
//   );
// });
