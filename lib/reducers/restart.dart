import 'package:flutter2048/store/GameState.dart';

class GameRestartAction {
  int mode;

  GameRestartAction(this.mode);
}

GameState gameRestart(GameState state, GameRestartAction action) {
  return GameState.initial(action.mode);
}
