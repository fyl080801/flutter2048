import 'dart:math';

import 'package:flutter/material.dart';
import './GameBg.dart';
import './Playground.dart';
import '../model/GameStatus.dart';

class GameStage extends StatefulWidget {
  const GameStage({Key key, this.status}) : super(key: key);

  final GameStatus status;

  @override
  State<StatefulWidget> createState() => GameStageState(status);
}

class GameStageState extends State<GameStage> {
  GameStageState(this.status);

  GameStatus status;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    setGameType(4);
                  },
                  child: Text('4'),
                ),
                RaisedButton(
                  onPressed: () {
                    setGameType(6);
                  },
                  child: Text('6'),
                ),
                RaisedButton(
                  onPressed: () {
                    setGameType(8);
                  },
                  child: Text('8'),
                )
              ],
            ),
          ),
          Stack(
            children: <Widget>[
              GameBg(
                gameType: status.gameType,
              ),
              Playground(
                gameType: status.gameType,
              )
            ],
          )
        ],
      ),
    );
  }

  void setGameType(int type) {
    var random = new Random();
    var gamesize = status.gameType * status.gameType;
    var block1 = random.nextInt(gamesize - 1);
    var block2 = random.nextInt(gamesize - 1);

    while (block1 == block2) {
      block2 = random.nextInt(gamesize);
    }

    setState(() {
      status.gameType = type;
    });
  }
}
