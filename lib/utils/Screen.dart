import './Device.dart';

class Screen {
  /// 随着大小间距变化
  static double getBorderWidth(int gameType) {
    return double.parse((2.5 / gameType).toStringAsFixed(2)) * 10;
  }

  static double getBlockWidth(int gameType) {
    return (Screen.stageWidth - getBorderWidth(gameType) * (gameType + 1)) /
        gameType;
  }

  static double get margin => 10;

  static double get stageWidth => Device.getRpx(Device.size.width) - margin * 2;
}
