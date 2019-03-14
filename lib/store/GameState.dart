import 'dart:math';

import 'package:flutter2048/store/BlockInfo.dart';
import 'package:flutter2048/store/GameStatus.dart';

class GameState {
  GameState({this.data, this.status, this.mode});

  int mode;
  GameStatus status;
  List<BlockInfo> data;
  // List<List<int>> data;

  static GameState initial(int mode) {
    var random = new Random();
    var gamesize = mode * mode;
    var block1 = random.nextInt(gamesize);
    var block2 = random.nextInt(gamesize);

    while (block1 == block2) {
      block2 = random.nextInt(gamesize);
    }

    var newdata = List<BlockInfo>();
    newdata.add(BlockInfo(
        currentValue: 2, currentX: block1 ~/ mode, currentY: block1 % mode));
    newdata.add(BlockInfo(
        currentValue: 2, currentX: block2 ~/ mode, currentY: block2 % mode));
    // for (var i = 0; i < mode; i++) {
    //   // var row = List<int>();
    //   for (var j = 0; j < mode; j++) {
    //     // row.add(0);
    //     if(i==block1 ~/ mode && j==block1 % mode){
    //       newdata.add(BlockInfo(currentValue: 2,currentX: i,currentY: j));
    //     }
    //   }
    //   // newdata.add(row);
    // }

    // newdata[block1 ~/ mode][block1 % mode] = 2;
    // newdata[block2 ~/ mode][block2 % mode] = 2;

    return GameState(
        mode: mode,
        status: GameStatus(adds: 0, moves: 0, scores: 0),
        data: newdata);
  }

  static GameState updateStatus(GameState state, GameStatus status) {
    return GameState(mode: state.mode, status: status, data: state.data);
  }
}
