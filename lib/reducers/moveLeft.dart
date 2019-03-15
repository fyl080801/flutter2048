import 'package:flutter2048/store/BlockInfo.dart';
import 'package:flutter2048/store/GameState.dart';
import 'package:flutter2048/store/GameStatus.dart';

class MoveLeftAction {}

GameState moveLeft(GameState state, MoveLeftAction action) {
  print('left');
  return GameState.update(state, move, add);
}

void move(List<List<BlockInfo>> data, int mode, GameStatus status) {
  int y, x, k;
  for (x = 0; x < mode; x++) {
    for (y = 1; y < mode; y++) {
      k = y;
      while (k - 1 >= 0 && data[k - 1][x].isEmpty()) {
        if (!data[k][x].isEmpty() || !data[k - 1][x].isEmpty()) status.moves++;
        data[k][x].swap(data[k - 1][x]);
        k--;
      }
    }
  }
}

void add(List<List<BlockInfo>> data, int mode, GameStatus status) {
  int y, x;
  for (x = 0; x < mode; x++) {
    for (y = 0; y < mode - 1; y++) {
      if (data[y][x].check(data[y + 1][x])) {
        data[y][x].combin(data[y + 1][x]);
        status.scores += data[y][x].value;
        status.adds++;
        move(data, mode, status);
      }
    }
  }
}
