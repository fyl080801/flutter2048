import 'package:flutter2048/store/GameState.dart';

class MoveLeftAction {}

GameState moveLeft(GameState state, MoveLeftAction action) {
  print('left');
  var clonestate = state.clone();
  int i, j, k;
  bool isMoved = false;
  for (i = 0; i < clonestate.mode; i++) {
    j = k = 0;
    while (true) {
      while (j < clonestate.mode && clonestate.getBlock(i, j).value == 0) j++;
      if (j > clonestate.mode - 1) break;

      if (j > k) {
        isMoved = true;
        var block = clonestate.getBlock(i, j);
        block.needMove = true;
        block.needCombine = false;
        clonestate.swapBlock(i * clonestate.mode + k, i * clonestate.mode + j);
      }

      if (k > 0 &&
          clonestate.getBlock(i, k).value ==
              clonestate.getBlock(i, k - 1).value &&
          clonestate.getBlock(i, k - 1).needCombine != true) {
        var currentBlock = clonestate.getBlock(i, k);
        var prevBlock = clonestate.getBlock(i, k - 1);
        prevBlock.before =
            isMoved ? currentBlock.before : (i * clonestate.mode + k);
        prevBlock.current = i * clonestate.mode + k - 1;
        prevBlock.value <<= 1;
        // updateCurScoresAndHistoryScores(numberkl.mScores);
        currentBlock.reset();
        currentBlock.current = currentBlock.before = i * clonestate.mode + k;
      } else {
        k++;
      }
      j++;
    }
  }

  return clonestate;
}
