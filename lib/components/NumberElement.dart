import 'package:flutter/material.dart';
import '../model/GameStatus.dart';

class NumberElement extends AnimatedWidget {
  const NumberElement({
    Key key,
    Animation<double> animation,
    this.status,
  }) : super(key: key, listenable: animation);

  final GameStatus status;

  @override
  Widget build(BuildContext context) {
    return null;
  }
}
