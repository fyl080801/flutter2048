import 'package:flutter_hello/reducers/moveLeft.dart';
import 'package:flutter_hello/reducers/restart.dart';
import 'package:flutter_hello/store/GameState.dart';
import 'package:redux/redux.dart';

final gameReducer = combineReducers<GameState>([
  TypedReducer<GameState, GameRestartAction>(gameRestart),
  TypedReducer<GameState, MoveLeftAction>(moveLeft)
]);
