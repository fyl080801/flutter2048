class BlockInfo {
  BlockInfo({this.value, this.current}) {
    this.before = this.current;
  }

  int value;
  int current;
  int before;
  bool needMove = false;
  bool needCombine = false;

  void reset() {
    value = 0;
    needMove = false;
    needCombine = false;
  }

  // BlockInfo({this.value, this.x, this.y, this.from});

  // int value;
  // int x;
  // int y;

  // BlockInfo from;

  // bool isEmpty() {
  //   if (this.value != 0) {
  //     return false;
  //   } else {
  //     return true;
  //   }
  // }

  // bool check(BlockInfo info) {
  //   return this.value != 0 && this.value == info.value;
  // }

  // void combin(BlockInfo info) {
  //   this.value += info.value;
  //   info.value = 0;
  // }

  // void swap(BlockInfo info) {
  //   var s = this.value;
  //   this.value = info.value;
  //   info.value = s;
  // }
}
