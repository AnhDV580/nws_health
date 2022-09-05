import 'package:flutter/material.dart';

class LoadingRowWidget extends StatelessWidget {
  final EdgeInsets padding;
  final double height;

  static final _defaultPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 8);

  LoadingRowWidget({this.padding, this.height = 200});

  @override
  Widget build(BuildContext context) {
    var padding = this.padding ?? _defaultPadding;
    return Container();
    // return Container(
    //   height: height,
    //   padding: padding,
    //   child: Container(
    //     child: Shimmer.fromColors(baseColor: Colors.grey[350], highlightColor: Colors.grey[100], child: Container(height: double.infinity, width: double.infinity, decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.0), color: Colors.white))),
    //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.0), boxShadow: AppShadow.boxShadow),
    //   ),
    // );
  }
}
