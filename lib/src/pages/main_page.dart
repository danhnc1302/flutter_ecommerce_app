import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/themes/themes.dart';
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            SingleChildScrollView(
              child: Container(
                height: AppTheme.fullHeight(context) - 50,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xfffbfbfb),
                      Color(0xfff7f7f7),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _appBar(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _appBar() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RotatedBox(
              quarterTurns: 4,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                color: Theme.of(context).backgroundColor,
                boxShadow: AppTheme.shadow,
              ),
              child: Icon(Icons.sort, size: 24, color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}
