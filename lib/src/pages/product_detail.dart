import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/themes/light_color.dart';
import 'package:flutter_ecommerce_app/src/themes/themes.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
                color: Colors.deepOrange
          ),
          child: InkWell(
            onTap: () {},
              child: const Icon(Icons.shopping_cart_checkout_outlined, size: 30, color: Colors.white)),
        ),
        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors:  [
                    Color(0xfffbfbfb),
                    Color(0xfff7f7f7),
                  ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
            ),
            child: Stack(
              children: [
                _appBar(),
              ],
            ),
          ),
      )
    );
  }

  Widget _appBar() {
    return Container(
        margin: AppTheme.hPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _icon(
            Icons.arrow_back_ios,
            color: Colors.black54,
            isOutLine: true,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          _icon(
            Icons.favorite,
            color: LightColor.red,
            isOutLine: true,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  Widget _icon(IconData icon, {
    Color color = LightColor.iconColor,
    bool isOutLine = false,
    required Function onPressed,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: LightColor.iconColor,
          style: isOutLine ? BorderStyle.solid : BorderStyle.none
        ),
        borderRadius: BorderRadius.circular(13),
        color:
          isOutLine ? Colors.transparent : Colors.white,
      ),
      child: Icon(icon, size: 24, color: color,),
    );
  }
}
