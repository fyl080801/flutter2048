import 'package:flutter2048/store/BlockInfo.dart';
import 'package:flutter2048/store/GameState.dart';
import 'package:flutter2048/store/GameStatus.dart';

class MoveRightAction {}

GameState moveRight(GameState state, MoveRightAction action) {
  print('right');
  return GameState.update(state, move, add);
}

void move(List<List<BlockInfo>> data, int mode, GameStatus status) {
  int y, x, k;
  for (x = 0; x < mode; x++) {
    for (y = mode - 2; y >= 0; y--) {
      k = y;
      while (k + 1 <= mode - 1 && data[k + 1][x].isEmpty()) {
        if (!data[k + 1][x].isEmpty() || !data[k][x].isEmpty()) status.moves++;
        data[k + 1][x].swap(data[k][x]);
        k++;
      }
    }
  }
}

void add(List<List<BlockInfo>> data, int mode, GameStatus status) {
  int y, x;
  for (x = 0; x < mode; x++) {
    for (y = mode - 1; y >= 1; y--) {
      if (data[y - 1][x].check(data[y][x])) {
        data[y - 1][x].combin(data[y][x]);
        status.scores += data[y - 1][x].value;
        status.adds++;
        move(data, mode, status);
      }
    }
  }
}
