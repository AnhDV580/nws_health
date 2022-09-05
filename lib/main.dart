import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newwave_health/repositories/healthcare_repository.dart';
import 'package:newwave_health/ui/home/home_cubit.dart';

import 'configs/app_config.dart';
import 'router/application.dart';
import 'router/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatefulWidget {
  MyApp() {
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<HealthcareRepository>(create: (context) {
          return HealthcareRepositoryImpl();
        }),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<HomeCubit>(create: (context) {
            return HomeCubit();
          }),
        ],
        child: materialApp(),
      ),
    );
  }

  MaterialApp materialApp() {
    return MaterialApp(
      title: AppConfig.appName,
      debugShowCheckedModeBanner: false,
      // theme: AppThemes.theme,
      onGenerateRoute: Application.router.generator,
      initialRoute: Routes.root,
      navigatorKey: navigatorKey,
    );
  }
}
