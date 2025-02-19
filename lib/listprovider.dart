import 'package:flutter/cupertino.dart';

class NumberListProvider extends ChangeNotifier {
  List<int> items = [1, 2, 3];
  void add() {
    int last = items.last;
    items.add(last + 1);
    notifyListeners();
  }

  void reduce() {
    items.removeLast();
    notifyListeners();
  }
}
