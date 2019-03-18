import 'package:flutter/material.dart';
import 'package:flutter2048/components/Blocks.dart';
import 'package:flutter2048/components/Scores.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import './GameBg.dart';
import './ModeSelector.dart';
import './Playground.dart';
import '../constants/Display.dart';
import '../reducers/index.dart';
import '../store/GameState.dart';

class GameStage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: Store<GameState>(gameReducer, initialState: GameState.initial(4)),
      child: Container(
        margin: EdgeInsets.all(Display.borderMargin),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ModeSelector(),
            Scores(),
            Stack(
              children: <Widget>[
                GameBg(),
                Blocks(),
                Playground(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
