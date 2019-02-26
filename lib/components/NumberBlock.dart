import 'package:flutter/material.dart';
import '../model/GameStatus.dart';
import './NumberElement.dart';

class NumberBlock extends StatefulWidget {
  const NumberBlock({Key key, this.status}) : super(key: key);

  final GameStatus status;

  @override
  State<StatefulWidget> createState() => NumberBlockState(status: status);
}

class NumberBlockState extends State<NumberBlock>
    with SingleTickerProviderStateMixin {
  NumberBlockState({this.status});

  GameStatus status;
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return NumberElement(
      status: status,
      animation: animation,
    );
  }
}
