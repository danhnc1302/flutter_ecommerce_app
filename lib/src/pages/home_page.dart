import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/themes/light_color.dart';
import 'package:flutter_ecommerce_app/src/themes/themes.dart';
import 'package:flutter_ecommerce_app/src/model/data.dart';
import 'package:flutter_ecommerce_app/src/widgets/product_icon.dart';
import 'package:flutter_ecommerce_app/src/widgets/product_cart.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 60),
          physics: const BouncingScrollPhysics(),
          dragStartBehavior: DragStartBehavior.start,
          child: Column(
            children: [
              _search(),
              _categoryWidget(),
              _productWidget(),
            ],
          ),
        ),
      );
  }

  Widget _productWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: AppTheme.fullWidth(context),
      height: AppTheme.fullWidth(context) * .7,
      child: GridView(
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 4/3,
          crossAxisSpacing: 20,
          mainAxisSpacing: 30,
        ),
        padding: const EdgeInsets.only(left: 20),
        children: AppData.productList.map(
            (product) => ProductCard(
              product: product,
              onSelected: (model) {
                setState(() {
                  AppData.productList.forEach((item) {
                    item.isSelected = false;
                  });
                  model.isSelected = true;
                });
              },
            )
        ).toList(),
    ),
    );
  }

  Widget _categoryWidget() {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
      width: AppTheme.fullWidth(context),
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: AppData.categoryList
          .map((category) => ProductIcon(
            model: category,
            onSelected: (model) {
              setState(() {
                AppData.categoryList.forEach((item) {
                  item.isSelected = false;
                });
                model.isSelected = true;
              });
            }
        )).toList()
      ),
    );
  }

  Widget _search() {
    return Container(
        margin: const EdgeInsets.only(right: 20, left: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: LightColor.lightGrey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Seach Products",
                    hintStyle: TextStyle(fontSize: 14, color: LightColor.lightGrey),
                    contentPadding: EdgeInsets.only(left: 10, right: 10, top: 10),
                    prefixIcon: Icon(Icons.search, size: 24, color: Colors.black54)
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey
              ),
              padding: const EdgeInsets.all(10),
              child: const Icon(Icons.filter_list, size: 24, color: Colors.black87),
            )
          ],
        ),
    );
  }
}
