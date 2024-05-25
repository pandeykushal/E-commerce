import 'package:flutter/material.dart';
import 'package:np_com_pandeykushal/view_model/utils/images.dart';

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

  final List<Map<String, String>> brands = [
    {"name": "NIKE", "image": CustomImageGetter.nikeyb, "items": "1001 Items"},
    {"name": "PUMA", "image": CustomImageGetter.pumna, "items": "950 Items"},
    {
      "name": "Adidas",
      "image": CustomImageGetter.adidas,
      "items": "1200 Items"
    },
    {"name": "Reebok", "image": CustomImageGetter.rebook, "items": "870 Items"},
  ];

  int _selectedIndexbrands = -1;

  int get selectedIndexbrands => _selectedIndexbrands;

  void selectBrand(int index) {
    _selectedIndexbrands = index;
    notifyListeners();
  }

  String _selectedButton = "";

  String get selectedButton => _selectedButton;

  void selectButton(String buttonName) {
    _selectedButton = buttonName;
    notifyListeners();
  }

  String _selectedButtonGender = "";

  String get selectedButtonGender => _selectedButtonGender;

  void selectedButtonGenders(String buttonName) {
    _selectedButtonGender = buttonName;
    notifyListeners();
  }

  String _selectedColor = "";

  String get selectedColor => _selectedColor;

  void selectColor(String color) {
    _selectedColor = color;
    notifyListeners();
  }

  reset() {
    _selectedColor = "";
    _selectedButtonGender = "";
    _selectedButtonGender = "";
    _selectedButton = "";
    _selectedIndexbrands = -1;
    notifyListeners();
  }
}
