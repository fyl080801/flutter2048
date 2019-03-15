class BlockInfo {
  BlockInfo({this.value, this.x, this.y, this.from});

  int value;
  int x;
  int y;

  BlockInfo from;

  bool isEmpty() {
    if (this.value != 0) {
      return false;
    } else {
      return true;
    }
  }

  bool check(BlockInfo info) {
    return this.value != 0 && this.value == info.value;
  }

  void combin(BlockInfo info) {
    this.value += info.value;
    info.value = 0;
    this.from = info;
  }

  void swap(BlockInfo info) {
    var s = this.value;
    this.value = info.value;
    info.value = s;
    this.from = info;
  }
}
