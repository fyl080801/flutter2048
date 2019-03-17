import 'package:flutter2048/store/GameState.dart';

class MoveDownAction {}

GameState moveDown(GameState state, MoveDownAction action) {
  if (state.status.end) return state.clone();

  var clonestate = state.clone();
  var i, j, k;
  bool isMoved = false;
  bool haveMove = false;
  bool haveCombin = false;
  for (i = 0; i < clonestate.mode; i++) {
    j = k = clonestate.mode - 1;
    while (true) {
      while (j > -1 && clonestate.getBlock(j, i).value == 0) j--;
      if (j < 0) break;

      if (j < k) {
        isMoved = haveMove = true;
        var block = clonestate.getBlock(j, i);
        block.needMove = true;
        block.needCombine = false;
        clonestate.swapBlock(k * clonestate.mode + i, j * clonestate.mode + i);
      }

      if (k < clonestate.mode - 1 &&
          clonestate.getBlock(k, i).value ==
              clonestate.getBlock(k + 1, i).value &&
          !clonestate.getBlock(k + 1, i).needCombine) {
        var currentBlock = clonestate.getBlock(k, i);
        var prevBlock = clonestate.getBlock(k + 1, i);
        prevBlock.before =
            isMoved ? currentBlock.before : (k * clonestate.mode + i);

        prevBlock.current = (k + 1) * clonestate.mode + i;
        prevBlock.needMove = true;
        prevBlock.needCombine = haveCombin = true;
        prevBlock.value <<= 1;
        clonestate.status.scores += prevBlock.value;
        currentBlock.reset();
        currentBlock.current = currentBlock.before = k * clonestate.mode + i;
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
