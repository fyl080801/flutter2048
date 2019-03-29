import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Device {
  static getRatio(int value) {
    int uiwidth = value is int ? value : 750;
    return ScreenUtil.mediaQueryData.size.width / uiwidth;
  }

  static getRpx(double value) {
    return value * getRatio(750);
  }

  static getBottomPadding() {
    return ScreenUtil.mediaQueryData.padding.bottom;
  }

  static getTopPadding() {
    return ScreenUtil.mediaQueryData.padding.top;
  }

  static getWidth() {
    return ScreenUtil.mediaQueryData.size.width;
  }

  static Platform platform = Platform();
}
