import 'package:flutter/material.dart';
import 'package:flutter2048/utils/Screen.dart';
import '../model/GameStatus.dart';
import './NumberElement.dart';

class NumberBlock extends StatefulWidget {
  const NumberBlock({Key key, this.status}) : super(key: key);

  final GameStatus status;

  @override
  State<StatefulWidget> createState() => NumberBlockState();
}

class NumberBlockState extends State<NumberBlock>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(milliseconds: 250), vsync: this);
    animation = Tween<double>(begin: 0, end: 50).animate(controller);
    controller.forward();
  }

  @override
  void setState(fn) {
    super.setState(fn);

    controller =
        AnimationController(duration: Duration(milliseconds: 250), vsync: this);
    animation = Tween<double>(begin: 0, end: 50).animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      controller = AnimationController(
          duration: Duration(milliseconds: 250), vsync: this);
      animation = Tween<double>(
        begin: 0,
        end: Screen.getBlockWidth(widget.status.gameType) +
            Screen.getBorderWidth(widget.status.gameType),
      ).animate(controller);
      controller.forward();
    });
    return new NumberElement(
      animation: animation,
      status: widget.status,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
