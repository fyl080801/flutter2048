class GameState {
  GameState({this.data, this.status, this.mode});

  int mode;
  GameStatus status;
  List<List<int>> data;

  static GameState initial() {
    return GameState(mode: 4, status: GameStatus(adds: 0, moves: 0, scores: 0));
  }
}

class GameStatus {
  GameStatus({this.adds, this.moves, this.scores});

  int scores;
  int adds;
  int moves;
}
