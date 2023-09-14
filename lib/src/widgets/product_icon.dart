import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/model/category.dart';
import 'package:flutter_ecommerce_app/src/themes/themes.dart';
import 'package:flutter_ecommerce_app/src/themes/light_color.dart';
import 'package:flutter_ecommerce_app/src/widgets/extentions.dart';

class ProductIcon extends StatelessWidget {
  final Category model;
  final ValueChanged<Category> onSelected;
  const ProductIcon({super.key, required this.model, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Container(
        padding: AppTheme.hPadding,
        decoration: BoxDecoration(
          color: model.isSelected ? LightColor.background : Colors.transparent,
          border: Border.all(
            width: model.isSelected ? 2 : 1,
            style: BorderStyle.solid,
            color: model.isSelected ? Colors.orange : Colors.grey,
          ),
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: model.isSelected ? const Color(0xfffbf2ef) : Colors.white,
              offset: const Offset(5, 5),
              spreadRadius: 5,
              blurRadius: 10,
            )
          ]
        ),
        child: Center(
          child: Row(
            children: [
              Image.asset(model.image),
              const SizedBox(width: 8),
              Text(
                model.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w500
                ),
              )
            ],
          ),
        ),
      ).ripple(() {
        onSelected(model);
      }, borderRadius: BorderRadius.circular(14)),
    );
  }
}
