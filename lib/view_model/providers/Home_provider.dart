import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  int _selectedShoeSize = 4;
  final List<double> sizes = [39, 39.5, 40, 40.5, 41];

  int get selectedShoeSize => _selectedShoeSize;

  void selectSize(int index) {
    _selectedShoeSize = index;
    notifyListeners();
  }

  void setIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
