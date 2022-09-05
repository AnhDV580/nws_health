import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newwave_health/commons/app_text_styles.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../models/enums/load_status.dart';
import '../widgets/app_button.dart';
import 'sync_health_data_cubit.dart';

class SyncHealthDataFirstTimePage extends StatefulWidget {
  const SyncHealthDataFirstTimePage({Key key}) : super(key: key);

  @override
  _SyncHealthDataFirstTimePageState createState() =>
      _SyncHealthDataFirstTimePageState();
}

class _SyncHealthDataFirstTimePageState
    extends State<SyncHealthDataFirstTimePage> {
  SyncHealthDataCubit _cubit;
  StreamSubscription _tokenExpiredSubscription;
  StreamSubscription _requestActivityRecognitionPermissionSubscription;

  @override
  void initState() {
    _cubit = SyncHealthDataCubit();
    super.initState();

    _cubit.initData();

    _requestActivityRecognitionPermissionSubscription = _cubit
        .requestActivityRecognitionPermissionController.stream
        .listen((data) {
      if (data) {
        _showDialogOpenSetting(
            title: "身体活動データにアクセスできません。", message: "設定から身体活動へのアクセスを許可してください。");
      }
    });
  }

  @override
  void dispose() {
    _tokenExpiredSubscription.cancel();
    _requestActivityRecognitionPermissionSubscription.cancel();
    _cubit.close();
    super.dispose();
  }

  void _showDialogOpenSetting({String title, String message}) {
    showCupertinoDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: new Text(title, style: AppTextStyle.blackS16W600),
          content: Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 8),
              child: Text(message, style: AppTextStyle.blackS12W300),
            ),
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                openAppSettings();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          body: SafeArea(
            top: true,
            bottom: true,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  SizedBox(height: 40),
                  _buildDescription(),
                  _buildSyncDataButton(),
                  _buildSkipSyncData(),
                  _buildTextNote(),
                  _buildBack(),
                ],
              ),
            ),
          ),
        ),
        onWillPop: _onBackPressed);
  }

  Widget _buildBack() {
    return Center(
      child: InkWell(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            '戻る',
            style: AppTextStyle.blackS12W300,
          ),
        ),
        onTap: () async {
          _onBackPressed();
        },
      ),
    );
  }

  // ignore: missing_return
  Future<bool> _onBackPressed() async {}

  Widget _buildDescription() {
    String _descriptionIOS =
        "はじめにヘルスケアアプリとの同期設定を行います。\n\n設定すると、以下のデータをヘルスケアアプリから定期的に取得します。\n\n・身長\n・体重\n・体脂肪率\n・歩数\n・安静時消費エネルギー\n・アクティブエネルギー";
    String _descriptionAndroid =
        "はじめにGoogle Fitとの同期設定を行います。\n\n設定すると、以下のデータをGoogle Fitから定期的に取得します。\n\n・身長\n・体重\n・体脂肪率\n・歩数\n・基礎代謝\n・消費エネルギー";
    String description = Platform.isIOS ? _descriptionIOS : _descriptionAndroid;
    return Container(
      child: Text(
        description,
        style: AppTextStyle.blackS16W600,
      ),
    );
  }

  Widget _buildSyncDataButton() {
    return BlocConsumer<SyncHealthDataCubit, SyncHealthDataState>(
      cubit: _cubit,
      buildWhen: (previous, current) {
        return previous.syncHealthDataStatus != current.syncHealthDataStatus;
      },
      listenWhen: (previous, current) {
        return previous.syncHealthDataStatus != current.syncHealthDataStatus;
      },
      listener: (context, state) {
        if (state.syncHealthDataStatus == LoadStatus.SUCCESS) {
          // HealthCareParam _healthDataEmpty = HealthCareParam(
          //     height: "0",
          //     bodyMass: "0",
          //     bodyFatPercentage: "0",
          //     stepCount: "0",
          //     basalEnergyBurned: "0",
          //     activeEnergyBurned: "0");
          // Application.router.navigateTo(context, Routes.syncHealthDataResult,
          //     routeSettings: RouteSettings(
          //       arguments: SyncHealthDataResultArgument(
          //         context: context,
          //         syncStateEnum: state.syncStateEnum,
          //         healthData:
          //             state.syncStateEnum == SyncStateEnum.ERROR_OR_NO_DATA
          //                 ? _healthDataEmpty
          //                 : state.healthData,
          //       ),
          //     ));
        }
      },
      builder: (context, state) {
        final loading = state.syncHealthDataStatus == LoadStatus.LOADING;
        return Container(
          margin: EdgeInsets.only(top: 35, bottom: 22, left: 20, right: 20),
          child: AppBlueButton(
            height: 40,
            title: '同期する',
            isLoading: loading,
            onPressed: _syncHealthData,
          ),
        );
      },
    );
  }

  Widget _buildSkipSyncData() {
    return Center(
      child: InkWell(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text('後で設定する', style: AppTextStyle.blackS12W300),
        ),
        onTap: () {
          // Application.router.navigateTo(context, Routes.firstTimeSignIn,
          //     routeSettings: RouteSettings(
          //       arguments: RegisterBodyInfoArgument(
          //         context: context,
          //         healthData: HealthCareParam(
          //             height: "0",
          //             bodyMass: "0",
          //             bodyFatPercentage: "0",
          //             stepCount: "0",
          //             basalEnergyBurned: "0",
          //             activeEnergyBurned: "0"),
          //       ),
          //     ));
        },
      ),
    );
  }

  Widget _buildTextNote() {
    String _note = Platform.isIOS
        ? 'ヘルスケアアプリとの同期は、設定画面から解除できます。'
        : 'Google Fitアプリとの同期は、設定画面から解除できます。';
    return Padding(
      child: Text(_note, style: AppTextStyle.blackS16W300),
      padding: EdgeInsets.only(top: 27, bottom: 8),
    );
  }

  Future<void> _syncHealthData() async {
    // _cubit.syncHealthData();
  }
}
