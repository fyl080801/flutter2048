import 'package:flutter/animation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter2048/components/block/CombinBlock.dart';
import 'package:flutter2048/components/block/MoveBlock.dart';
import 'package:flutter2048/components/block/NewBlock.dart';
import 'package:flutter2048/components/block/StaticBlock.dart';
import 'package:flutter2048/store/BlockInfo.dart';

class BlockFactory {
  AnimationController combinController;
  AnimationController addController;
  AnimationController moveController;
  int _mode;

  BlockFactory(TickerProvider provider, int mode) {
    combinController = AnimationController(
        duration: const Duration(milliseconds: 60), vsync: provider);
    addController = AnimationController(
        duration: const Duration(milliseconds: 80), vsync: provider);
    moveController = AnimationController(
        duration: const Duration(milliseconds: 80), vsync: provider);
    _mode = mode;
  }

  Widget create(BlockInfo info) {
    if (info.isNew) {
      return NewBlock(
        info: info,
        controller: this.addController,
      );
    }

    if (info.needCombine) {
      return CombinBlock(info: info, controller: combinController);
    }

    if (info.needMove && info.needCombine != true) {
      var currentY = info.current ~/ _mode;
      var currentX = info.current % _mode;
      var beforeY = info.before ~/ _mode;
      var beforeX = info.before % _mode;
      var direction = currentX == beforeX ? 1 : 0;
      return MoveBlock(
          info: info,
          direction: direction,
          begin:
              (direction == 0 ? beforeX - currentX : beforeY - currentY) * 1.0,
          controller: moveController);
    }

    return StaticBlock(
      info: info,
      controller: this.addController,
    );
  }

  play() {
    moveController.forward().whenComplete(() {
      addController.forward();
      combinController.forward().whenComplete(() {
        combinController.reverse();
      });
    });
  }
}
