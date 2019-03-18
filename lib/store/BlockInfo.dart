class BlockInfo {
  BlockInfo({this.value, this.current, this.before, this.isNew = true}) {
    this.before = this.before == null ? this.current : this.before;
  }

  int value;
  int current;
  int before;
  bool needMove = false;
  bool needCombine = false;
  bool isNew = false;

  void reset() {
    value = 0;
    needMove = false;
    needCombine = false;
    isNew = false;
  }
}
