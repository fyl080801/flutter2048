class Screen {
  /// 随着大小间距变化
  static double getBorderWidth(int gameType) {
    return double.parse((2.5 / gameType).toStringAsFixed(2)) * 10;
  }
}
