import 'dart:math';

import 'package:flutter2048/store/BlockInfo.dart';
import 'package:flutter2048/store/GameStatus.dart';

class GameState {
  GameState({this.data, this.status, this.mode});

  int mode;
  GameStatus status;
  List<List<BlockInfo>> data;

  static GameState initial(int mode) {
    var random = new Random();
    var gamesize = mode * mode;
    var block1 = random.nextInt(gamesize);
    var block2 = random.nextInt(gamesize);

    while (block1 == block2) {
      block2 = random.nextInt(gamesize);
    }

    var newdata = List<List<BlockInfo>>();

    for (var i = 0; i < mode; i++) {
      var row = List<BlockInfo>();
      for (var j = 0; j < mode; j++) {
        var current = i * mode + j;
        row.add(BlockInfo(
            value: current == block1 || current == block2 ? 2 : 0,
            current: current));
      }
      newdata.add(row);
    }

    return GameState(
      mode: mode,
      status: GameStatus(
        adds: 0,
        moves: 0,
        scores: 0,
        end: false,
      ),
      data: newdata,
    );
  }

  BlockInfo getBlock(int i, int j) {
    return this.data[i][j];
  }

  int blankCount() {
    int count = 0;
    for (var i = 0; i < mode; i++) {
      for (var j = 0; j < mode; j++) {
        if (data[i][j].value == 0) {
          count++;
        }
      }
    }
    return count;
  }

  int getBlank(int blank) {
    int count = 0;
    for (int i = 0; i < mode; i++) {
      for (int j = 0; j < mode; j++) {
        if (data[i][j].value == 0) {
          if (count == blank) {
            return i * mode + j;
          } else {
            count++;
          }
        }
      }
    }
    return -1;
  }

  void swapBlock(int block1, int block2) {
    data[block1 ~/ mode][block1 % mode].current = block2;
    data[block1 ~/ mode][block1 % mode].before = block1;
    data[block2 ~/ mode][block2 % mode].current = block1;
    data[block2 ~/ mode][block2 % mode].before = block2;
    var temp = data[block1 ~/ mode][block1 % mode];
    data[block1 ~/ mode][block1 % mode] = data[block2 ~/ mode][block2 % mode];
    data[block2 ~/ mode][block2 % mode] = temp;
  }

  GameState clone() {
    var newdata = List<List<BlockInfo>>();
    for (var i = 0; i < mode; i++) {
      var row = List<BlockInfo>();
      for (var j = 0; j < mode; j++) {
        row.add(BlockInfo(
          current: data[i][j].current,
          value: data[i][j].value,
        ));
      }
      newdata.add(row);
    }

    return GameState(
      data: newdata,
      mode: this.mode,
      status: GameStatus(
        adds: this.status.adds,
        end: this.status.end,
        moves: this.status.moves,
        scores: this.status.scores,
      ),
    );
  }

  // static GameState update(
  //   GameState state,
  //   Function move,
  //   Function add,
  // ) {
  //   if (state.status.end) return state;

  //   var copydata = state.cloneData();
  //   var copystatus = state.cloneStatus();

  //   move(copydata, state.mode, copystatus);
  //   add(copydata, state.mode, copystatus);

  //   if (copystatus.adds > 0 || copystatus.moves > 0) {
  //     copystatus.end = true;
  //     var empty = new List<BlockInfo>();
  //     for (var i = 0; i < state.mode; i++) {
  //       for (var j = 0; j < state.mode; j++) {
  //         if (copydata[i][j].isEmpty()) {
  //           empty.add(copydata[i][j]);
  //         }
  //       }
  //     }

  //     if (empty.length > 0) {
  //       var random = new Random();
  //       empty[random.nextInt(empty.length)].value = 2;
  //     }

  //     if (empty.length <= 1) {
  //       int i, j;
  //       for (i = 0; i < state.mode; i++) {
  //         for (j = 0; j < state.mode - 1; j++) {
  //           if (copydata[i][j].check(copydata[i][j + 1])) {
  //             copystatus.end = false;
  //             break;
  //           }
  //         }
  //       }

  //       for (j = 0; j < state.mode; j++) {
  //         for (i = 0; i < state.mode - 1; i++) {
  //           if (copydata[i][j].check(copydata[i + 1][j])) {
  //             copystatus.end = false;
  //             break;
  //           }
  //         }
  //       }
  //     } else {
  //       copystatus.end = false;
  //     }
  //   }
  //   return GameState(
  //     data: copydata,
  //     mode: state.mode,
  //     status: copystatus,
  //   );
  // }

  // List<List<BlockInfo>> cloneData() {
  //   var copydata = new List<List<BlockInfo>>();
  //   this.data.forEach((row) {
  //     var newrow = List<BlockInfo>();
  //     row.forEach((info) {
  //       newrow.add(
  //         BlockInfo(
  //           value: info.value,
  //           x: info.x,
  //           y: info.y,
  //         ),
  //       );
  //     });
  //     copydata.add(newrow);
  //   });
  //   return copydata;
  // }

  // GameStatus cloneStatus() {
  //   return GameStatus(
  //     adds: 0,
  //     moves: 0,
  //     scores: this.status.scores,
  //     end: this.status.end,
  //   );
  // }
}
