import 'dart:math';
import 'package:flutter/foundation.dart';

class Sort with ChangeNotifier {
  Sort() {
    this.getData();
  }
  List<double> array = List<double>.filled(50, 0.0);
  int prev = -1;
  int curr = -1;
  int sorted = -1;
  bool isSorting = false;

  void getData() {
    prev = -1;
    curr = -1;
    sorted = -1;
    isSorting = false;
    var rand = Random();
    for (var i = 0; i < 50; i++) {
      array[i] = rand.nextDouble() * 100;
      notifyListeners();
    }
  }

  Future startSorting() {}

  void stopSorting() {
    isSorting = false;
    notifyListeners();
  }

  Future sleep() async {
    await Future.delayed(const Duration(milliseconds: 25), () {});
  }
}
