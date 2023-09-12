import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/model/category.dart';
class ProductIcon extends StatelessWidget {
  final Category model;
  final ValueChanged<Category> onSelected;
  const ProductIcon({super.key, required this.model, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      margin: EdgeInsets.only(right: 10),
      color: Colors.orangeAccent,
    );
  }
}
