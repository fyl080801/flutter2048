import 'package:flutter/material.dart';

class NewBlock extends AnimatedWidget {
  final int value;
  final double top;
  final double left;
  final double width;

  NewBlock(
      {Key key,
      this.value,
      this.top,
      this.left,
      this.width,
      Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    Animation<double> animation = listenable;
    return Positioned(
      top: top, // x * (props.blockWidth + props.borderWidth),
      left: left, // y * (props.blockWidth + props.borderWidth),
      child: Transform.scale(
        scale: animation.value,
        origin: Offset(0.5, 0.5),
        child: Container(
          width: width, // props.blockWidth,
          height: width, // props.blockWidth,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.transparent, width: 0),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(value.toString()),
          ),
        ),
      ),
    );
  }
}
