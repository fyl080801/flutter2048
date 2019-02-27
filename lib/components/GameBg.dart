import 'package:flutter/material.dart';
import '../utils/Screen.dart';

class GameBg extends StatelessWidget {
  const GameBg({Key key, this.gameType}) : super(key: key);

  final int gameType;

  double get borderWidth => Screen.getBorderWidth(gameType);

  double get blockWidth => Screen.getBlockWidth(gameType);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(borderWidth, borderWidth, 0, 0),
      decoration: BoxDecoration(
        color: const Color(0xffbbada0),
        border: Border.all(color: Colors.transparent, width: 0),
        borderRadius: BorderRadius.circular(5),
      ),
      child: getGrid(),
    );
  }

  getGrid() {
    var rows = <Widget>[];
    for (var i = 0; i < gameType; i++) {
      var columns = <Widget>[];
      for (var j = 0; j < gameType; j++) {
        columns.add(Container(
          width: blockWidth,
          height: blockWidth,
          decoration: BoxDecoration(
            color: Color.fromRGBO(238, 228, 218, 0.35),
            border: Border.all(color: Colors.transparent, width: 0),
            borderRadius: BorderRadius.circular(5),
          ),
          margin: EdgeInsets.fromLTRB(0, 0, borderWidth, borderWidth),
        ));
      }
      rows.add(Row(
        textDirection: TextDirection.ltr,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: columns,
      ));
    }
    return Column(
      children: rows,
      crossAxisAlignment: CrossAxisAlignment.center,
    );
  }
}
