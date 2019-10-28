import 'package:flutter/material.dart';
import './components/GameStage.dart';
import './components/ViewScaffold.dart';

void main() => runApp(GameApp());

class GameApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GameAppState();
}

class GameAppState extends State<GameApp> {
  @override
  Widget build(BuildContext context) {
    return ViewScaffold(
      children: <Widget>[
        GameStage(),
      ],
    );
  }
}
