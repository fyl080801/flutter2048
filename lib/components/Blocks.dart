import 'package:flutter/material.dart';
import '../model/GameStatus.dart';
import './NumberBlock.dart';
import '../utils/Screen.dart';

class Blocks extends StatelessWidget {
  const Blocks({Key key, this.status}) : super(key: key);

  final GameStatus status;

  double get borderWidth => Screen.getBorderWidth(status.gameType);

  double get blockWidth => Screen.getBlockWidth(status.gameType);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Screen.stageWidth,
      height: Screen.stageWidth,
      padding: EdgeInsets.fromLTRB(borderWidth, borderWidth, 0, 0),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[NumberBlock(status: status)],
      ),
    );
  }
}
