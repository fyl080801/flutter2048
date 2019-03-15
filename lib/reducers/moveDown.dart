import 'package:flutter2048/store/BlockInfo.dart';
import 'package:flutter2048/store/GameState.dart';
import 'package:flutter2048/store/GameStatus.dart';

class MoveDownAction {}

GameState moveDown(GameState state, MoveDownAction action) {
  print('down');
  return GameState.update(state, move, add);
}

void move(List<List<BlockInfo>> data, int mode, GameStatus status) {
  int y, x, k;
  for (y = 0; y < mode; y++) {
    for (x = mode - 2; x >= 0; x--) {
      k = x;
      while (k + 1 <= mode - 1 && data[y][k + 1].isEmpty()) {
        if (!data[y][k + 1].isEmpty() || !data[y][k].isEmpty()) status.moves++;
        data[y][k + 1].swap(data[y][k]);
        k++;
      }
    }
  }
  // return moves;
}

void add(List<List<BlockInfo>> data, int mode, GameStatus status) {
  // int adds = 0;
  int y, x;
  for (y = 0; y < mode; y++) {
    for (x = mode - 1; x >= 1; x--) {
      if (data[y][x].check(data[y][x - 1])) {
        data[y][x].combin(data[y][x - 1]);
        status.scores += data[y][x].value;
        status.adds++;
        move(data, mode, status);
      }
    }
  }
  // return adds;
}
