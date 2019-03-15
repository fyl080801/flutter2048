import 'package:flutter2048/store/BlockInfo.dart';
import 'package:flutter2048/store/GameState.dart';
import 'package:flutter2048/store/GameStatus.dart';

class MoveUpAction {}

GameState moveUp(GameState state, MoveUpAction action) {
  print('up');
  return GameState.update(state, move, add);
}

void move(List<List<BlockInfo>> data, int mode, GameStatus status) {
  int y, x, k;
  for (y = 0; y < mode; y++) {
    for (x = 1; x < mode; x++) {
      k = x;
      while (k - 1 >= 0 && data[y][k - 1].isEmpty()) {
        if (!data[y][k].isEmpty() || !data[y][k - 1].isEmpty()) status.moves++;
        data[y][k].swap(data[y][k - 1]);
        k--;
      }
    }
  }
}

void add(List<List<BlockInfo>> data, int mode, GameStatus status) {
  int y, x;
  for (y = 0; y < mode; y++) {
    for (x = 0; x < mode - 1; x++) {
      if (data[y][x].check(data[y][x + 1])) {
        data[y][x].combin(data[y][x + 1]);
        status.scores += data[y][x].value;
        status.adds++;
        move(data, mode, status);
      }
    }
  }
}
