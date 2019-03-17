import 'package:flutter2048/store/GameState.dart';

class MoveRightAction {}

GameState moveRight(GameState state, MoveRightAction action) {
  print('right');
  var clonestate = state.clone();
  int i, j, k;
  bool isMoved = false;
  for (i = 0; i < clonestate.mode; i++) {
    j = k = clonestate.mode - 1;
    while (true) {
      while (j > -1 && clonestate.getBlock(i, j).value == 0) j--;
      if (j < 0) break;

      if (j < k) {
        isMoved = true;
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
        prevBlock.value <<= 1;
        // updateCurScoresAndHistoryScores(numberkl.mScores);
        currentBlock.reset();
        currentBlock.current = currentBlock.before = i * clonestate.mode + k;
      } else {
        k--;
      }
      j--;
    }
  }

  return clonestate;
}
