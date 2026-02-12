import 'package:flutter/cupertino.dart';

class ActionButtons<T> {
  static int _counter = 0;
  static int autoIncrement() => ++_counter;

  final int id;
  final String? title;
  final Icon? icon;
  final T Function() action;

  ActionButtons(this.title, this.icon, this.action)
      : id = autoIncrement();
}
