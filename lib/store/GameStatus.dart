/// 当前状态
class GameStatus {
  GameStatus({
    this.adds,
    this.moves,
    this.scores,
    this.end,
  });

  int scores;
  int adds;
  int moves;
  bool end;
}
