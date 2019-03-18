import 'package:flutter/material.dart';
import 'package:flutter2048/components/NumberText.dart';
import 'package:flutter2048/components/block/BaseBlock.dart';
import 'package:flutter2048/components/block/MoveBlock.dart';
import 'package:flutter2048/store/BlockInfo.dart';

class CombinBlock extends BaseBlock {
  final BlockInfo info;
  final int mode;
  final AnimationController moveController;

  CombinBlock({
    Key key,
    this.info,
    this.mode,
    this.moveController,
    AnimationController combinController,
  }) : super(
          key: key,
          animation:
              Tween<double>(begin: 1, end: 1.25).animate(combinController),
        );

  @override
  Widget buildBlock(BuildContext context, BlockProps props) {
    Animation<double> animation = listenable;
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        MoveBlock(
          info: BlockInfo(
            isNew: false,
            value: info.value ~/ 2,
            before: info.before,
            current: info.current,
          ),
          mode: mode,
          controller: moveController,
        ),
        Positioned(
          top: (info.current ~/ props.mode) *
              (props.blockWidth + props.borderWidth),
          left: (info.current % props.mode) *
              (props.blockWidth + props.borderWidth),
          child: Transform.scale(
            scale: animation.value,
            origin: Offset(0.5, 0.5),
            child: NumberText(value: this.info.value, size: props.blockWidth),
          ),
        )
      ],
    );
  }
}
