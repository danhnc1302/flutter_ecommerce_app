import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/model/product.dart';
import 'package:flutter_ecommerce_app/src/themes/light_color.dart';
import 'package:flutter_ecommerce_app/src/widgets/extentions.dart';
class ProductCard extends StatelessWidget {
  final Product product;
  final ValueChanged<Product> onSelected;

  const ProductCard(
      {Key? key, required this.product, required this.onSelected});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: LightColor.background,
          boxShadow: const [
            BoxShadow(
                spreadRadius: 15, color: Color(0xfff8f8f8), blurRadius: 10)
          ]),
      margin: EdgeInsets.symmetric(vertical: !product.isSelected ? 20 : 0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              top: 0,
              left: 0,
              child: IconButton(
                icon: Icon(
                    product.isLiked ? Icons.favorite : Icons.favorite_outline,
                    size: 24,
                    color: product.isLiked
                        ? LightColor.red
                        : LightColor.iconColor),
                onPressed: () {},
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: product.isSelected ? 15 : 0),
              Expanded(
                  child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.orange.withOpacity(0.2),
                  ),
                  Image.asset(product.image)
                ],
              )),
              Text(product.name,
                  style: TextStyle(
                      fontSize: product.isSelected ? 16 : 14,
                      fontWeight: FontWeight.w700)),
              const SizedBox(height: 2),
              Text(product.category,
                  style: TextStyle(
                      color: Colors.orangeAccent,
                      fontSize: product.isSelected ? 14 : 12,
                      fontWeight: FontWeight.w700)),
              const SizedBox(height: 4),
              Text("\$ " + product.price.toString(),
                  style: TextStyle(
                      fontSize: product.isSelected ? 18 : 16,
                      fontWeight: FontWeight.w700)),
            ],
          )
        ],
      ),
    ).ripple(() {
      Navigator.of(context).pushNamed('/detail');
      onSelected(product);
    }, borderRadius: const BorderRadius.all(Radius.circular(20)));

  }
}
