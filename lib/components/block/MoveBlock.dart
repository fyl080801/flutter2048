import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter2048/components/NumberText.dart';
import 'package:flutter2048/components/block/BaseBlock.dart';
import 'package:flutter2048/store/BlockInfo.dart';

class MoveBlock extends BaseBlock {
  final BlockInfo info;
  final int direction;
  final double begin;
  final double end;

  MoveBlock({
    Key key,
    this.info,
    this.direction,
    this.begin,
    this.end,
    AnimationController controller,
  }) : super(
          key: key,
          animation: Tween<double>(
            begin: begin,
            end: 0,
          ).animate(controller),
        );

  @override
  Widget buildBlock(BuildContext context, BlockProps props) {
    Animation<double> animation = listenable;
    return Positioned(
      top:
          (info.current ~/ props.mode) * (props.blockWidth + props.borderWidth),
      left:
          (info.current % props.mode) * (props.blockWidth + props.borderWidth),
      child: Transform.translate(
        offset: direction == 0
            ? Offset(
                animation.value * (props.blockWidth + props.borderWidth), 0)
            : Offset(
                0, animation.value * (props.blockWidth + props.borderWidth)),
        child: NumberText(value: this.info.value, size: props.blockWidth),
      ),
    );
  }
}

void getDirection(double current, double before) {}
