import 'package:flutter2048/store/GameState.dart';

class MoveUpAction {}

GameState moveUp(GameState state, MoveUpAction action) {
  print('up');
  var clonestate = state.clone();
  int i, j, k;
  bool isMoved = false;
  for (i = 0; i < clonestate.mode; i++) {
    j = k = 0;
    while (true) {
      while (j < clonestate.mode && clonestate.getBlock(j, i).value == 0) j++;
      if (j > clonestate.mode - 1) break;

      if (j > k) {
        isMoved = true;
        var block = clonestate.getBlock(j, i);
        block.needMove = true;
        block.needCombine = false;
        clonestate.swapBlock(k * clonestate.mode + i, j * clonestate.mode + i);
      }

      if (k > 0 &&
          clonestate.getBlock(k, i).value ==
              clonestate.getBlock(k - 1, i).value &&
          clonestate.getBlock(k - 1, i).needCombine != true) {
        var currentBlock = clonestate.getBlock(k, i);
        var prevBlock = clonestate.getBlock(k - 1, i);
        prevBlock.before =
            isMoved ? currentBlock.before : (k * clonestate.mode + i);
        prevBlock.current = (k - 1) * clonestate.mode + i;
        prevBlock.value <<= 1;
        // updateCurScoresAndHistoryScores(numberkl.mScores);
        currentBlock.reset();
        currentBlock.current = currentBlock.before = k * clonestate.mode + i;
      } else {
        k++;
      }
      j++;
    }
  }

  return clonestate;
}
