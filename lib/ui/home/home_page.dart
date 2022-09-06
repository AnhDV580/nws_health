import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newwave_health/ui/home/home_cubit.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../commons/app_text_styles.dart';

class HomePage extends StatefulWidget {
  final DateTime dateTime;

  const HomePage({Key key, this.dateTime}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  HomeCubit _cubit;

  @override
  bool get wantKeepAlive => true;

  StreamSubscription _reloadHomePageSubscription;
  StreamSubscription _addActivityToDateSubscription;
  StreamSubscription _loadStatusSubscription;
  StreamSubscription _changeGoalSubscription;
  StreamSubscription _requestActivityRecognitionPermissionSubscription;

  @override
  void initState() {
    _cubit = BlocProvider.of<HomeCubit>(context);
    super.initState();
    // _cubit.changeSelectedDateTime(widget.dateTime);
    // _cubit.loadActivityDetail(isGetHealthDataWhenAppStart: true);

    _loadStatusSubscription =
        _cubit.loadStatusSuccessController.stream.listen((message) {
      // _displayDialog(message: message);
    });

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
    _loadStatusSubscription.cancel();
    _cubit.close();
    _changeGoalSubscription.cancel();
    _addActivityToDateSubscription.cancel();
    _reloadHomePageSubscription.cancel();
    _requestActivityRecognitionPermissionSubscription.cancel();
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
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        child: Stack(
          children: [
            // _buildLoadActivityDetail(),
            _buildBody(),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      width: double.infinity,
      height: double.infinity,
      child: _buildContentWidget(),
    );
  }

  Widget _buildContentWidget() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Center(
          child: InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: const Text(
                "Sync Health data",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            onTap: () {
              _cubit.getHealthCareData();
            },
          ),
        ),
      ),
    );
    // return BlocBuilder<HomeCubit, HomeState>(
    //     buildWhen: (prev, current) {
    //       return prev.loadActivityStatus != current.loadActivityStatus ||
    //           prev.onAsyncStatus != current.onAsyncStatus;
    //     },
    //     cubit: _cubit,
    //     builder: (context, state) {
    //       if (state.loadActivityStatus == LoadStatus.LOADING ||
    //           state.onAsyncStatus == LoadStatus.LOADING) {
    //         return Container(
    //           margin: EdgeInsets.only(top: 8.0),
    //           child: LoadingListWidget(
    //             rowPadding:
    //                 EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
    //             rowHeight: 216,
    //           ),
    //         );
    //       } else if (state.loadActivityStatus == LoadStatus.FAILURE) {
    //         return _showErrorWidget('当日のデータがありません。');
    //       } else if (state.loadActivityStatus == LoadStatus.SUCCESS) {
    //         return RefreshIndicator(
    //           child: ListView(
    //             children: <Widget>[],
    //           ),
    //           onRefresh: _onRefreshData,
    //         );
    //       } else {
    //         return Container();
    //       }
    //     });
  }

  Future<void> _onRefreshData() async {
    // _cubit.loadActivityDetail();
  }

  // Widget _buildLoadActivityDetail() {
  //   return BlocListener<HomeCubit, HomeState>(
  //     listenWhen: (prev, current) {
  //       return prev.selectedDateTime != current.selectedDateTime;
  //     },
  //     listener: (context, state) async {
  //       bool isHaveAccessInternet =
  //           await CheckInternetUtils.isHaveAccessInternet(context);
  //       if (isHaveAccessInternet) {
  //         _cubit.loadActivityDetail();
  //       }
  //     },
  //     child: Container(),
  //   );
  // }

  // Future<bool> _displayDialog({String message}) async {
  //   return showDialog(
  //       useRootNavigator: true,
  //       context: context,
  //       barrierDismissible: false,
  //       builder: (BuildContext context) {
  //             return CupertinoAlertDialog(
  //               title: Text(message),
  //               content: SizedBox(height: 40),
  //               actions: <Widget>[
  //                 CupertinoDialogAction(
  //                   child: Text('キャンセル',
  //                       style: TextStyle(
  //                           fontWeight: FontWeight.w600, fontSize: 16)),
  //                   onPressed: () => Navigator.of(context).pop(false),
  //                 ),
  //                 CupertinoDialogAction(
  //                     child: Text('OK',
  //                         style: TextStyle(
  //                             fontWeight: FontWeight.w600, fontSize: 16)),
  //                     onPressed: () async {
  //                       bool isHaveAccessInternet =
  //                           await CheckInternetUtils.isHaveAccessInternet(
  //                               context);
  //                       if (isHaveAccessInternet) {
  //                         Navigator.pushReplacement(
  //                             context,
  //                             MaterialPageRoute(
  //                                 builder: (context) => ProfileDetailPage()));
  //                       }
  //                     }),
  //               ],
  //             );
  //           } ??
  //           false);
  // }
  //
  // Widget _showErrorWidget(String content) {
  //   return Container(
  //     height: 200,
  //     width: double.infinity,
  //     child: Center(
  //       child: Text(
  //         content,
  //         style: AppTextStyle.greyS18W800,
  //       ),
  //     ),
  //   );
  // }
}
