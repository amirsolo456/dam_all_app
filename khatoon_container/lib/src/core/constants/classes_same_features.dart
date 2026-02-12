mixin AutoIncrement {
  static int _counter = 0;

  int get nextId {
    _counter++;
    return _counter;
  }
}
