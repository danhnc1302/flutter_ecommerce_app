import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/model/product.dart';
import 'package:flutter_ecommerce_app/src/themes/light_color.dart';
import 'package:flutter_ecommerce_app/src/themes/themes.dart';
import 'package:flutter_ecommerce_app/src/model/data.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key});

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {

  double getPrice() {
    double price = 0;
    AppData.cartList.forEach((x) {
      price += x.price * x.id;
    });
    return price;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppTheme.padding,
      child: SingleChildScrollView(
        child: Column(
          children: [
            _cartItems(),
            const Divider(
              thickness: 1,
              height: 70,
            ),
            _price(),
            const SizedBox(height: 30),
            _submitButton(context),
          ],
        ),
      ),
    );
  }

  Widget _submitButton(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(LightColor.orange),
      ),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 10),
        width: AppTheme.fullWidth(context) * .9,
        child: const Text(
          'Next',
          style: TextStyle(
            color: LightColor.background,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _price() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppData.cartList.length.toString() + " items",
          style: const TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.w500
          ),
        ),
        Text(
          '\$${getPrice()}',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }

  Widget _cartItems() {
    return Column(children: AppData.cartList.map((e) => _item(e)).toList());
  }

  Widget _item(Product product) {
    return Container(
        height: 80,
        margin: const EdgeInsets.only(bottom: 10),
        child: Row(children: [
          AspectRatio(
            aspectRatio: 1.2,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: SizedBox(
                    height: 70,
                    width: 70,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            decoration: BoxDecoration(
                                color: LightColor.lightGrey,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: -20,
                  bottom: -20,
                  child: Image.asset(product.image),
                )
              ],
            ),
          ),
          Expanded(
            child: ListTile(
              title: Text(
                product.name,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              subtitle: Row(children: [
                const Text(
                  '\$',
                  style: TextStyle(
                      color: Colors.orange,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  product.price.toString(),
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                )
              ]),
              trailing: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                    color: LightColor.lightGrey.withAlpha(150),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    'x${product.id}',
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ),
            ),
          )
        ]));
  }
}
