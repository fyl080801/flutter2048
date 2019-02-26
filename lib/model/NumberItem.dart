class NumberItem {
  NumberItem({this.value});

  int value;

  void combine(NumberItem item) {
    this.value += item.value;
    item.reset(0);
  }

  void swap(NumberItem item) {
    var swaper = this.value;
    this.value = item.value;
    item.value = swaper;
  }

  bool isEmpty() {
    return this.value == 0;
  }

  void reset(int val) {
    this.value = val;
  }

  bool check(NumberItem item) {
    return this.value == item.value && this.value != 0;
  }
}
