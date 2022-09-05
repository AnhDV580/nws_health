import 'package:flutter/material.dart';

import '../../commons/app_colors.dart';
import '../../commons/app_shadow.dart';
import 'loading_indicator_widget.dart';

class _AppButton extends StatelessWidget {
  String title;
  bool isLoading;
  bool isEnable;
  VoidCallback onPressed;

  Color textColor;
  Color backgroundColor;
  Color inactiveColor;
  double height;

  _AppButton(
      {this.title = '',
      this.isLoading = false,
      this.onPressed,
      this.height = 40});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      child: ButtonTheme(
        minWidth: 0.0,
        height: 0.0,
        padding: EdgeInsets.all(0),
        child: Container(
          height: 40,
          child: FlatButton(
            child: _buildBodyWidget(),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            onPressed: isEnable ? onPressed : null,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: isEnable ? backgroundColor : inactiveColor,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        boxShadow: AppShadow.boxShadow,
      ),
    );
  }

  Widget _buildBodyWidget() {
    if (isLoading) {
      return LoadingIndicatorWidget(color: Colors.white);
    } else {
      return Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      );
    }
  }
}

class AppWhiteButton extends _AppButton {
  AppWhiteButton({
    String title = '',
    bool isLoading = false,
    bool isEnable = true,
    VoidCallback onPressed,
  }) {
    this.title = title;
    this.isLoading = isLoading;
    this.onPressed = onPressed;
    this.isEnable = isEnable;
    //SetupUI
    textColor = AppColors.main;
    backgroundColor = AppColors.white;
  }
}

class AppBlackButton extends _AppButton {
  AppBlackButton({
    String title = '',
    bool isLoading = false,
    bool isEnable = true,
    VoidCallback onPressed,
  }) {
    this.title = title;
    this.isLoading = isLoading;
    this.onPressed = onPressed;
    this.isEnable = isEnable;
    //SetupUI
    textColor = Colors.white;
    backgroundColor = AppColors.textBlack;
    inactiveColor = AppColors.lightGreyBorder;
  }
}

class AppGreyButton extends _AppButton {
  AppGreyButton({
    String title = '',
    bool isLoading = false,
    bool isEnable = true,
    VoidCallback onPressed,
    double height,
    Color backgroundColor,
  }) {
    this.title = title;
    this.isLoading = isLoading;
    this.onPressed = onPressed;
    this.isEnable = isEnable;
    this.height = height;
    //SetupUI
    textColor = Colors.white;
    this.backgroundColor = backgroundColor ?? AppColors.lightGreyBorder;
    inactiveColor = AppColors.lightGreyBorder;
  }
}

class AppBlueButton extends _AppButton {
  AppBlueButton({
    String title = '',
    bool isLoading = false,
    bool isEnable = true,
    VoidCallback onPressed,
    double height,
    Color backgroundColor,
  }) {
    this.title = title;
    this.isLoading = isLoading;
    this.onPressed = onPressed;
    this.isEnable = isEnable;
    this.height = height;
    //SetupUI
    textColor = Colors.white;
    this.backgroundColor = backgroundColor ?? AppColors.main;
    inactiveColor = AppColors.lightGreyBorder;
  }
}

class AppBlueSkyButton extends _AppButton {
  AppBlueSkyButton({
    String title = '',
    bool isLoading = false,
    bool isEnable = true,
    VoidCallback onPressed,
  }) {
    this.title = title;
    this.isLoading = isLoading;
    this.onPressed = onPressed;
    this.isEnable = isEnable;
    //SetupUI
    textColor = Colors.white;
    backgroundColor = AppColors.txtBlueColor;
    inactiveColor = AppColors.lightGreyBorder;
  }
}

class AppOrangeButton extends _AppButton {
  AppOrangeButton({
    String title = '',
    bool isLoading = false,
    bool isEnable = true,
    VoidCallback onPressed,
  }) {
    this.title = title;
    this.isLoading = isLoading;
    this.onPressed = onPressed;
    this.isEnable = isEnable;
    //SetupUI
    textColor = Colors.white;
    backgroundColor = AppColors.orange;
    inactiveColor = AppColors.lightGreyBorder;
  }
}
