import 'package:flutter/material.dart';
import 'package:flutter_hello/components/GameBg.dart';
import 'package:flutter_hello/model/GameStatus.dart';

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
          GameBg(
            gameType: status.gameType,
          )
        ],
      ),
    );
  }

  void setGameType(int type) {
    setState(() {
      status.gameType = type;
    });
  }
}
