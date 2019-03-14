import 'package:flutter/material.dart';
import 'package:flutter2048/components/block/BaseBlock.dart';
import 'package:flutter2048/store/BlockInfo.dart';

class NewBlock extends BaseBlock {
  final BlockInfo info;

  NewBlock({
    Key key,
    int mode,
    this.info,
    AnimationController controller,
  }) : super(
          key: key,
          mode: mode,
          animation: new Tween<double>(begin: 0.0, end: 1).animate(controller),
        );

  @override
  Widget build(BuildContext context) {
    Animation<double> animation = listenable;
    return Positioned(
      top: this.info.currentY * this.width,
      left: this.info.currentX * this.width,
      child: Transform.scale(
        scale: animation.value,
        origin: Offset(0.5, 0.5),
        child: Container(
          width: this.blockWidth,
          height: this.blockWidth,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.transparent, width: 0),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(this.info.currentValue.toString()),
          ),
        ),
      ),
    );
  }
}
