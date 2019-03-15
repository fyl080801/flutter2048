import 'package:flutter2048/store/BlockInfo.dart';
import 'package:flutter2048/store/GameState.dart';

class MoveRightAction {}

GameState moveRight(GameState state, MoveRightAction action) {
  doMoveRight(state.data);
  doAddRight(state.data);
  return GameState(status: state.status, data: state.data, mode: state.mode);
}

bool isEmpty(BlockInfo info) {
  return info.currentValue == 0 || info.currentValue == null;
}

bool check(BlockInfo info1, BlockInfo info2) {
  return info1.currentValue == info2.currentValue &&
      info1.currentValue == null &&
      info1.currentValue != 0;
}

BlockInfo find(List<BlockInfo> data, x, y) {
  return data.firstWhere((item) {
    return item.currentX == x && item.currentY == y;
  });
}

void swap(List<BlockInfo> data, x1, y1, x2, y2) {}

void combin(List<BlockInfo> data, x1, y1, x2, y2) {}

int doMoveRight(List<BlockInfo> data) {
  int moves = 0;
  int i, j, k;
  for (i = 0; i < 4; i++) {
    for (j = 2; j >= 0; j--) {
      k = j;
      var next = find(data, i, k + 1);
      var current = find(data, i, k);
      while (k + 1 <= 3 && isEmpty(next)) {
        if (!isEmpty(next) || !isEmpty(current)) moves++;
        swap(data, i, k + 1, i, k);
        k++;
      }
    }
  }
  return moves;
}

int doAddRight(List<BlockInfo> data) {
  int adds = 0;
  int i, j;
  for (i = 0; i < 4; i++) {
    for (j = 3; j >= 1; j--) {
      var prev = find(data, i, j - 1);
      var current = find(data, i, j);
      if (check(current, prev)) {
        combin(data, i, j, i, j - 1);
        adds++;
        doMoveRight(data);
      }
    }
  }
  return adds;
}
