import 'package:flutter/animation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter2048/components/block/BaseBlock.dart';
import 'package:flutter2048/components/block/NewBlock.dart';
import 'package:flutter2048/store/BlockInfo.dart';
import 'package:flutter2048/utils/Screen.dart';

class BlockFactory {
  int gamemode;
  double blockWidth;
  double borderWidth;
  AnimationController increaseController;
  AnimationController addController;
  AnimationController moveController;

  BlockFactory(this.gamemode, TickerProvider provider) {
    blockWidth = Screen.getBlockWidth(this.gamemode);
    borderWidth = Screen.getBorderWidth(this.gamemode);
    increaseController = AnimationController(
        duration: const Duration(milliseconds: 50), vsync: provider);
    addController = AnimationController(
        duration: const Duration(milliseconds: 80), vsync: provider);
    moveController = AnimationController(
        duration: const Duration(milliseconds: 100), vsync: provider);
  }

  BaseBlock create(BlockInfo info) {
    // 四种情况的不同创建方法和行为
    // 新建:直接从无到有的动画
    // 单合并:元素不动，单建一个上一个状态的方块做移动，之后本身做一个缩放动画
    // 移动合并:两个元素，传两个controller，本身先移动，到位置后缩放，另一个直接移动到最终位置
    // 单移动:从开始位置移到最终位置
    if (info.prevValue == null) {
      // 新
      return NewBlock(
        mode: gamemode,
        info: info,
        controller: this.addController,
      );
    } else if (info.currentValue != info.prevValue) {
      // 合并
    }

    return null;
  }

  play() {
    moveController.forward().whenComplete(() {
      addController.forward();
      increaseController.forward();
    });
  }
}
