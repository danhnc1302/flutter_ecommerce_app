import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/themes/light_color.dart';
import 'package:flutter_ecommerce_app/src/themes/themes.dart';

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
    return Scaffold(
        body: Container(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          dragStartBehavior: DragStartBehavior.start,
          child: Column(
            children: [
              _search(),
            ],
          ),
        ),
      ),
    );
  }
  Widget _search() {
    return Container(

        margin: EdgeInsets.only(right: 20, left: 20, top: 50),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: LightColor.lightGrey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8)
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
              child: Icon(Icons.filter_list, size: 24, color: Colors.black87),
            )
          ],
        ),
    );
  }
}
