import 'package:flutter/material.dart';
import '../utils/Screen.dart';
import '../utils/Device.dart';

class GameBg extends StatelessWidget {
  const GameBg({Key key, this.gameType}) : super(key: key);

  final int gameType;

  double get borderWidth => Screen.getBorderWidth(gameType);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
        padding: EdgeInsets.fromLTRB(borderWidth, borderWidth, 0, 0),
        height: Device.getRpx(Device.size.width),
        decoration: BoxDecoration(
            color: const Color(0xffbbada0),
            border: Border.all(color: Colors.transparent, width: 0),
            borderRadius: BorderRadius.circular(5)),
        child: getGrid(gameType, borderWidth));
  }
}

getGrid(int gameType, borderWidth) {
  var rows = <Widget>[];
  for (var i = 0; i < gameType; i++) {
    var columns = <Widget>[];
    for (var j = 0; j < gameType; j++) {
      columns.add(Expanded(
        child: Container(
          decoration: BoxDecoration(
              color: Color.fromRGBO(238, 228, 218, 0.35),
              border: Border.all(color: Colors.transparent, width: 0),
              borderRadius: BorderRadius.circular(5)),
          margin: EdgeInsets.fromLTRB(0, 0, borderWidth, borderWidth),
        ),
      ));
    }
    rows.add(Expanded(
      child: Row(
        textDirection: TextDirection.ltr,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: columns,
      ),
    ));
  }
  return Column(
    children: rows,
    crossAxisAlignment: CrossAxisAlignment.center,
  );
}
