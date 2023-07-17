import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class AppSize {
  static const layoutHeight = 844;
  static const layoutWidth = 390;

  static double itemHeight(BuildContext context, double height) {
    return MediaQuery.of(context).size.height * height / layoutHeight;
  }

  static double itemWidth(BuildContext context, double width) {
    return MediaQuery.of(context).size.width * width / layoutWidth;
  }

  static double itemSize(BuildContext context, double height, double width) {
    final hSize = MediaQuery.of(context).size.height * height / layoutHeight;
    final wSize = MediaQuery.of(context).size.width * width / layoutWidth;

    return (hSize + wSize) / 2;
  }
}
