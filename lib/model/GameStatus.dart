class GameStatus {
  /// game mode
  int gameType = 4;

  /// have number which can add
  int adds = 0;

  /// already moved count
  int moves = 0;

  int scores = 0;

  double getBorderWidth() {
    return double.parse((2.5 / gameType).toStringAsFixed(2)) * 10;
  }
}
