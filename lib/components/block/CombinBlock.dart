import 'package:flutter/material.dart';
import 'package:flutter2048/components/NumberText.dart';
import 'package:flutter2048/components/block/BaseBlock.dart';
import 'package:flutter2048/store/BlockInfo.dart';

class CombinBlock extends BaseBlock {
  final BlockInfo info;

  CombinBlock({
    Key key,
    this.info,
    AnimationController controller,
  }) : super(
          key: key,
          animation: Tween<double>(begin: 1, end: 1.25).animate(controller),
        );

  @override
  Widget buildBlock(BuildContext context, BlockProps props) {
    Animation<double> animation = listenable;
    return Positioned(
      top:
          (info.current ~/ props.mode) * (props.blockWidth + props.borderWidth),
      left:
          (info.current % props.mode) * (props.blockWidth + props.borderWidth),
      child: Transform.scale(
        scale: animation.value,
        origin: Offset(0.5, 0.5),
        child: NumberText(value: this.info.value, size: props.blockWidth),
      ),
    );
  }
}
