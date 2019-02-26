import 'package:flutter/material.dart';
import '../utils/Screen.dart';

class Blocks extends StatelessWidget {
  const Blocks({Key key, this.gameType}) : super(key: key);

  final int gameType;

  double get borderWidth => Screen.getBorderWidth(gameType);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          child: Text('aaa'),
        )
      ],
    );
  }
}
