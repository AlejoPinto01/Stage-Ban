import 'package:flutter/cupertino.dart';
import 'package:stage_ban_sbs/src/data/data.dart';

class Counter extends ChangeNotifier {
  int counter = getCounter();
  Counter() {
    this.counter = getCounter();
    notifyListeners();
  }
}
