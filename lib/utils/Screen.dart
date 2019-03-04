import 'package:flutter2048/constants/Display.dart';

import './Device.dart';

class Screen {
  /// 随着大小间距变化
  static double getBorderWidth(int gameType) {
    return Display.spacerUnit / gameType * Display.borderMargin;
  }

  static double getBlockWidth(int gameType) {
    return (Screen.stageWidth - getBorderWidth(gameType) * (gameType + 1)) /
        gameType;
  }

  static double get stageWidth =>
      Device.getRpx(Device.size.width) - Display.borderMargin * 2;
}
