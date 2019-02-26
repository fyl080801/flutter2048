import 'package:flutter/material.dart';
import 'package:flutter_hello/utils/Device.dart';
import '../utils/Screen.dart';

class Blocks extends StatelessWidget {
  const Blocks({Key key, this.gameType}) : super(key: key);

  final int gameType;

  double get borderWidth => Screen.getBorderWidth(gameType);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: Device.getRpx(Device.size.width),
        ),
        Positioned(top: 10.0, left: 10.0, child: Text('aaa'))
      ],
    );
  }
}
