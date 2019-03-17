class BlockInfo {
  BlockInfo({this.value, this.current}) {
    this.before = this.current;
  }

  int value;
  int current;
  int before;
  bool needMove = false;
  bool needCombine = false;
  bool isNew = true;

  void reset() {
    value = 0;
    needMove = false;
    needCombine = false;
    isNew = false;
  }
}
