import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/themes/theme.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
// Theme
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;

    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }

// products for sale
  final List<Product> _shop = [
    Product(
        name: "White Sweatshirt",
        price: 79.99,
        description: "Soft and cozy white sweatshirt for casual wear.",
        imagePath: "assets/nike_1.webp"),
    Product(
        name: "Dark Sweater",
        price: 89.99,
        description: "Warm and stylish dark sweater for the winter season.",
        imagePath: "assets/nike_2.jpg"),
    Product(
        name: "White Formal Jacket",
        price: 129.99,
        description: "Elegant white formal jacket for special occasions.",
        imagePath: "assets/nike_3.avif"),
    Product(
        name: "Windbreaker",
        price: 69.99,
        description:
            "Lightweight and water-resistant windbreaker for outdoor activities.",
        imagePath: "assets/nike_4.webp")
  ];
// user cart
  List<Product> _cart = [];
// get product list
  List<Product> get shop => _shop;
// get user cart
  List<Product> get cart => _cart;

// add item to cart
  void addTocart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

// remove item from cart
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
