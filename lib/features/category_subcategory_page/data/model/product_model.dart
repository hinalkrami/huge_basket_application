import 'package:flutter/cupertino.dart';

class Product {
  Product({required this.productImage, required this.productName, required this.productPrice, required this.productWeight, required this.cartCount});
  String productImage;
  String productPrice;
  String productName;
  String productWeight;
  ValueNotifier<int> cartCount;
  ValueNotifier<bool> isSelected = ValueNotifier(false);
}
