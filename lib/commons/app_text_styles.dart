import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyle {
  ///Black
  static final black = TextStyle(color:AppColors.textBlack);

  //s8
  static final blackS8 = black.copyWith(fontSize: 8);
  static final blackS8w600 = blackS8.copyWith(fontWeight: FontWeight.w600);
  //s10
  static final blackS10 = black.copyWith(fontSize: 10);
  static final blackS10w300 = blackS10.copyWith(fontWeight: FontWeight.w300);
  static final blackS10w600 = blackS10.copyWith(fontWeight: FontWeight.w600);

  //s12
  static final blackS12 = black.copyWith(fontSize: 12);
  static final blackS12Bold = blackS12.copyWith(fontWeight: FontWeight.bold);
  static final blackS12W600 = blackS12.copyWith(fontWeight: FontWeight.w600);
  static final blackS12W800 = blackS12.copyWith(fontWeight: FontWeight.w800);
  static final blackS12W300 = blackS12.copyWith(fontWeight: FontWeight.w300);

  //s14
  static final blackS14 = black.copyWith(fontSize: 14);
  static final blackS14Bold = blackS14.copyWith(fontWeight: FontWeight.bold);
  static final blackS14W600 = blackS14.copyWith(fontWeight: FontWeight.w600);
  static final blackS14W800 = blackS14.copyWith(fontWeight: FontWeight.w800);
  static final blackS14W300 = blackS14.copyWith(fontWeight: FontWeight.w300);

  //s16
  static final blackS16 = black.copyWith(fontSize: 16);
  static final blackS16Bold = blackS16.copyWith(fontWeight: FontWeight.bold);
  static final blackS16W300 = blackS16.copyWith(fontWeight: FontWeight.w300);
  static final blackS16W600 = blackS16.copyWith(fontWeight: FontWeight.w600);
  static final blackS16W800 = blackS16.copyWith(fontWeight: FontWeight.w800);

  //s18
  static final blackS18 = black.copyWith(fontSize: 18);
  static final blackS18Bold = blackS18.copyWith(fontWeight: FontWeight.bold);
  static final blackS18W800 = blackS18.copyWith(fontWeight: FontWeight.w800);

  //s20
  static final blackS20 = black.copyWith(fontSize: 20);
  static final blackS20Bold = blackS20.copyWith(fontWeight: FontWeight.bold);
  static final blackS20W600 = blackS20.copyWith(fontWeight: FontWeight.w600);
  static final blackS20W800 = blackS20.copyWith(fontWeight: FontWeight.w800);

  //s22
  static final blackS22 = black.copyWith(fontSize: 22);
  static final blackS22W600 = blackS22.copyWith(fontWeight: FontWeight.w600);

  //s22
  static final blackS26 = black.copyWith(fontSize: 26);
  static final blackS26W600 = blackS22.copyWith(fontWeight: FontWeight.w600);
  static final blackS26W300 = blackS22.copyWith(fontWeight: FontWeight.w300);

  //S30
  static final blackS30 = black.copyWith(fontSize: 30);
  static final blackS30W300 = blackS30.copyWith(fontWeight: FontWeight.w300);

  ///Blue
  static final blue = TextStyle(color: CupertinoColors.systemBlue);
  //s14
  static final blueS14 = blue.copyWith(fontSize: 14);
  static final blueS14Bold = blueS14.copyWith(fontWeight: FontWeight.bold);
  static final blueS14W600 = blueS14.copyWith(fontWeight: FontWeight.w600);
  static final blueS14W800 = blueS14.copyWith(fontWeight: FontWeight.w800);
  static final blueS14W300 = blueS14.copyWith(fontWeight: FontWeight.w300);

  //s16
  static final blueS16 = blue.copyWith(fontSize: 16);
  static final blueS16Bold = blueS16.copyWith(fontWeight: FontWeight.bold);
  static final blueS16W300 = blueS16.copyWith(fontWeight: FontWeight.w300);
  static final blueS16W600 = blueS16.copyWith(fontWeight: FontWeight.w600);
  static final blueS16W800 = blueS16.copyWith(fontWeight: FontWeight.w800);


  ///White
  static final white = TextStyle(color: Colors.white);

  //s10
  static final whiteS10 = white.copyWith(fontSize: 10);
  static final whiteS10W600 = whiteS10.copyWith(fontWeight: FontWeight.w600);
  //s12
  static final whiteS12 = white.copyWith(fontSize: 12);
  static final whiteS12Bold = whiteS12.copyWith(fontWeight: FontWeight.bold);
  static final whiteS12W800 = whiteS12.copyWith(fontWeight: FontWeight.w800);
  static final whiteS12W600 = whiteS12.copyWith(fontWeight: FontWeight.w600);

  //s14
  static final whiteS14 = white.copyWith(fontSize: 14);
  static final whiteS14Bold = whiteS14.copyWith(fontWeight: FontWeight.bold);
  static final whiteS14W800 = whiteS14.copyWith(fontWeight: FontWeight.w800);
  static final whiteS14W600 = whiteS14.copyWith(fontWeight: FontWeight.w600);
  static final whiteS14W300 = whiteS14.copyWith(fontWeight: FontWeight.w300);

  //s16
  static final whiteS16 = white.copyWith(fontSize: 16);
  static final whiteS16Bold = whiteS16.copyWith(fontWeight: FontWeight.bold);
  static final whiteS16W600 = whiteS16.copyWith(fontWeight: FontWeight.w600);
  static final whiteS16W800 = whiteS16.copyWith(fontWeight: FontWeight.w800);

  //s18
  static final whiteS18 = white.copyWith(fontSize: 18);
  static final whiteS18Bold = whiteS18.copyWith(fontWeight: FontWeight.bold);
  static final whiteS18W800 = whiteS18.copyWith(fontWeight: FontWeight.w800);

  ///Gray
  static final grey = TextStyle(color: Colors.grey);

  //s12
  static final greyS12 = grey.copyWith(fontSize: 12);
  static final greyS12Bold = greyS12.copyWith(fontWeight: FontWeight.bold);
  static final greyS12W800 = greyS12.copyWith(fontWeight: FontWeight.w800);
  static final greyS12W600 = greyS12.copyWith(fontWeight: FontWeight.w600);

  //s14
  static final greyS14 = grey.copyWith(fontSize: 14);
  static final greyS14Bold = greyS14.copyWith(fontWeight: FontWeight.bold);
  static final greyS14W600 = greyS14.copyWith(fontWeight: FontWeight.w600);
  static final greyS14W800 = greyS14.copyWith(fontWeight: FontWeight.w800);

  //s16
  static final greyS16 = grey.copyWith(fontSize: 16);
  static final greyS16Bold = greyS16.copyWith(fontWeight: FontWeight.bold);
  static final greyS16W800 = greyS16.copyWith(fontWeight: FontWeight.w800);

  //s18
  static final greyS18 = grey.copyWith(fontSize: 18);
  static final greyS18Bold = greyS18.copyWith(fontWeight: FontWeight.bold);
  static final greyS18W800 = greyS18.copyWith(fontWeight: FontWeight.w800);

  ///blue
 static final blueSky=TextStyle(color: AppColors.deepSkyBlue);
  //s16
  static final blueSkyS16 = blueSky.copyWith(fontSize: 16);
  static final blueSkyS16W600 = blueSkyS16.copyWith(fontWeight: FontWeight.w600);
 //

  // ///Tint
  // static final tint = TextStyle(color: AppColors.main);
  //
  // //s12
  // static final tintS12 = tint.copyWith(fontSize: 12);
  // static final tintS12Bold = tintS12.copyWith(fontWeight: FontWeight.bold);
  // static final tintS12W800 = tintS12.copyWith(fontWeight: FontWeight.w800);
  //
  // //s14
  // static final tintS14 = tint.copyWith(fontSize: 14);
  // static final tintS14Bold = tintS14.copyWith(fontWeight: FontWeight.bold);
  // static final tintS14W800 = tintS14.copyWith(fontWeight: FontWeight.w800);
  //
  // //s16
  // static final tintS16 = tint.copyWith(fontSize: 16);
  // static final tintS16Bold = tintS16.copyWith(fontWeight: FontWeight.bold);
  // static final tintS16W800 = tintS16.copyWith(fontWeight: FontWeight.w800);
  //
  // //s18
  // static final tintS18 = tint.copyWith(fontSize: 18);
  // static final tintS18Bold = tintS18.copyWith(fontWeight: FontWeight.bold);
  // static final tintS18W800 = tintS18.copyWith(fontWeight: FontWeight.w800);
}
