import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hello/model/TapStatus.dart';
import '../utils/Screen.dart';
import '../utils/Device.dart';

const pressTimeout = 200;
const dragLength = 300;

/// 用于响应交互操作
class Playground extends StatelessWidget {
  Playground(
      {Key key,
      this.gameType,
      this.onRight,
      this.onLeft,
      this.onUp,
      this.onDown,
      this.onMoved})
      : super(key: key);

  final int gameType;
  final Function onRight;
  final Function onLeft;
  final Function onUp;
  final Function onDown;
  final Function onMoved;

  final TapStatus status = TapStatus();

  double get borderWidth => Screen.getBorderWidth(gameType);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: onDragStart,
      onHorizontalDragEnd: onHorizontalDragEnd,
      onVerticalDragStart: onDragStart,
      onVerticalDragEnd: onVerticalDragEnd,
      child: Container(
        color: Colors.transparent,
        height: Screen.stageWidth,
      ),
    );
  }

  void onDragStart(DragStartDetails evt) {
    status.startTime = DateTime.now().millisecondsSinceEpoch;
  }

  void onHorizontalDragEnd(DragEndDetails evt) {
    if (DateTime.now().millisecondsSinceEpoch - status.startTime >
            pressTimeout ||
        evt.primaryVelocity.abs() < dragLength) return;

    if (evt.primaryVelocity > 0) {
      this.onRight();
      this.onMoved();
    } else {
      this.onLeft();
      this.onMoved();
    }
  }

  void onVerticalDragEnd(DragEndDetails evt) {
    if (DateTime.now().millisecondsSinceEpoch - status.startTime >
            pressTimeout ||
        evt.primaryVelocity.abs() < dragLength) return;

    if (evt.primaryVelocity > 0) {
      this.onUp();
      this.onMoved();
    } else {
      this.onDown();
      this.onMoved();
    }
  }
}
