// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/screen_util.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';

import '../constants/Display.dart';
import './Device.dart';

class Screen {
  static init(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
      designSize: Size(750, 1334),
    );
  }

  /// 随着大小间距变化
  static double getBorderWidth(int gameType) {
    return Display.spacerUnit / gameType * Display.borderMargin;
  }

  static double getBlockWidth(int gameType) {
    return (Screen.stageWidth - getBorderWidth(gameType) * (gameType + 1)) /
        gameType;
  }

  static double get stageWidth => Device.getWidth() - Display.borderMargin * 2;
}
