import './moveDown.dart';
import './moveLeft.dart';
import './moveRight.dart';
import './moveUp.dart';
import './restart.dart';
import '../store/GameState.dart';
import 'package:redux/redux.dart';

final gameReducer = combineReducers<GameState>([
  TypedReducer<GameState, GameRestartAction>(gameRestart),
  TypedReducer<GameState, MoveLeftAction>(moveLeft),
  TypedReducer<GameState, MoveRightAction>(moveRight),
  TypedReducer<GameState, MoveUpAction>(moveUp),
  TypedReducer<GameState, MoveDownAction>(moveDown),
]);
