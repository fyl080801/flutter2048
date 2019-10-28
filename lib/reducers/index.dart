import 'package:flutter2048/reducers/updateState.dart';
import './moveDown.dart';
import './moveLeft.dart';
import './moveRight.dart';
import './moveUp.dart';
import '../store/GameState.dart';
import 'package:redux/redux.dart';

final gameReducer = combineReducers<GameState>([
  TypedReducer<GameState, UpdateStateAction>(updateState),
  TypedReducer<GameState, MoveLeftAction>(moveLeft),
  TypedReducer<GameState, MoveRightAction>(moveRight),
  TypedReducer<GameState, MoveUpAction>(moveUp),
  TypedReducer<GameState, MoveDownAction>(moveDown),
]);
