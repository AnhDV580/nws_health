import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemes {
  static ThemeData theme = ThemeData(
    primaryColor: AppColors.deepSkyBlue,
    primarySwatch: Colors.blue,
    primaryTextTheme: TextTheme(button: TextStyle(color: Colors.white)),
    backgroundColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    // appBarTheme: AppBarTheme(
    //     elevation: 0,
    //     color: Colors.white,
    //     iconTheme: IconThemeData(color: Colors.white),
    //     centerTitle: true,
    //     textTheme:
    //         // ignore: deprecated_member_use
    //         TextTheme(title: TextStyle(color: Colors.black, fontSize: 18)),
    //     brightness: Brightness.dark,
    //     shadowColor: AppColors.shadowColor),
    // buttonTheme: ButtonThemeData(
    //   buttonColor: AppColors.main,
    // ),
    // visualDensity: VisualDensity.adaptivePlatformDensity,
    // fontFamily: 'Muli',
    // cursorColor: AppColors.main,
    // focusColor: AppColors.main,
    // bottomNavigationBarTheme: BottomNavigationBarThemeData(
    //   backgroundColor: Colors.white,
    //   elevation: 10,
    //   selectedItemColor: AppColors.main,
    //   selectedLabelStyle: AppTextStyle.tintS16,
    //   type: BottomNavigationBarType.fixed,
    //   showSelectedLabels: true,
    //   selectedIconTheme: IconThemeData(color: AppColors.main, size: 24),
    //   showUnselectedLabels: true,
    //   unselectedIconTheme: IconThemeData(
    //     color: AppColors.main,
    //     size: 24,
    //   ),
    //   unselectedItemColor: AppColors.main,
    //   unselectedLabelStyle: AppTextStyle.blackS12,
    // ),
  );
}
