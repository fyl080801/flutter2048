import 'package:flutter2048/reducers/moveDown.dart';
import 'package:flutter2048/reducers/moveLeft.dart';
import 'package:flutter2048/reducers/moveRight.dart';
import 'package:flutter2048/reducers/moveUp.dart';
import 'package:flutter2048/reducers/restart.dart';
import 'package:flutter2048/store/GameState.dart';
import 'package:redux/redux.dart';

final gameReducer = combineReducers<GameState>([
  TypedReducer<GameState, GameRestartAction>(gameRestart),
  TypedReducer<GameState, MoveLeftAction>(moveLeft),
  TypedReducer<GameState, MoveRightAction>(moveRight),
  TypedReducer<GameState, MoveUpAction>(moveUp),
  TypedReducer<GameState, MoveDownAction>(moveDown),
]);
