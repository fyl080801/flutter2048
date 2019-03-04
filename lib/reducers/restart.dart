import 'package:flutter2048/store/GameState.dart';

class GameRestartAction {
  int mode;

  GameRestartAction(this.mode);
}

GameState gameRestart(GameState state, GameRestartAction action) {
  return GameState(
      mode: action.mode, status: GameStatus(adds: 0, moves: 0, scores: 0));
}
