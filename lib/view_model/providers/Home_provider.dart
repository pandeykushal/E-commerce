// ignore_for_file: file_names, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:np_com_pandeykushal/view_model/utils/images.dart';

import '../../model/app_models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeProvider extends ChangeNotifier {
  int _selectedShoeSize = 4;
  final List<double> sizes = [39, 39.5, 40, 40.5, 41];

  int get selectedShoeSize => _selectedShoeSize;

  void selectSize(int index) {
    _selectedShoeSize = index;
    notifyListeners();
  }

  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;
  void setIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  int selectedIndexRating = 0;

  int get selectedIndexRatings => selectedIndexRating;
  void setIndexRating(int index) {
    selectedIndexRating = index;
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

  List<Product> product = [];
  bool isLoadingProduct = false;

  Future<void> fetchProduct() async {
    try {
      isLoadingProduct = true;
      notifyListeners();
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection("products").get();
      product = snapshot.docs
          .map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      isLoadingProduct = false;
      notifyListeners();
    } catch (e) {
      isLoadingProduct = false;
      notifyListeners();
    }
  }

  List<Product> _cartItems = [];

  List<Product> get cartItems => _cartItems;

  void addToCart(Product product) {
    _cartItems.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cartItems.remove(product);
    notifyListeners();
  }

  double getTotalPrice() {
    double total = 0.0;
    for (var item in _cartItems) {
      total += item.price ?? 0;
    }
    return total;
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
