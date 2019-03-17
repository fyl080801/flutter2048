import 'package:flutter2048/store/GameState.dart';

class MoveRightAction {}

GameState moveRight(GameState state, MoveRightAction action) {
  if (state.status.end) return state.clone();

  var clonestate = state.clone();
  int i, j, k;
  bool isMoved = false;
  bool haveMove = false;
  bool haveCombin = false;
  for (i = 0; i < clonestate.mode; i++) {
    j = k = clonestate.mode - 1;
    while (true) {
      while (j > -1 && clonestate.getBlock(i, j).value == 0) j--;
      if (j < 0) break;

      if (j < k) {
        isMoved = haveMove = true;
        var block = clonestate.getBlock(i, j);
        block.needMove = true;
        block.needCombine = false;
        clonestate.swapBlock(i * clonestate.mode + k, i * clonestate.mode + j);
      }

      if (k < clonestate.mode - 1 &&
          clonestate.getBlock(i, k).value ==
              clonestate.getBlock(i, k + 1).value &&
          clonestate.getBlock(i, k + 1).needCombine != true) {
        var currentBlock = clonestate.getBlock(i, k);
        var prevBlock = clonestate.getBlock(i, k + 1);
        prevBlock.before =
            isMoved ? currentBlock.before : (i * clonestate.mode + k);
        prevBlock.current = i * clonestate.mode + k + 1;
        prevBlock.needMove = true;
        prevBlock.needCombine = haveCombin = true;
        prevBlock.value <<= 1;
        clonestate.status.scores += prevBlock.value;
        currentBlock.reset();
        currentBlock.current = currentBlock.before = i * clonestate.mode + k;
      } else {
        k--;
      }
      j--;
    }
  }

  if (haveMove || haveCombin) {
    clonestate.update();
  }
  return clonestate;
}
