import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/themes/themes.dart';
import 'package:flutter_ecommerce_app/src/widgets/extentions.dart';
import 'package:flutter_ecommerce_app/src/pages/home_page.dart';
import 'package:flutter_ecommerce_app/src/pages/shopping_cart_page.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isHomePageSelected = true;
  int _selectedIdx = 0;
  void onBottomIconPressed(int index) {
    if (index == 0 || index == 1) {
      setState(() {
        isHomePageSelected = true;
      });
    } else {
      setState(() {
        isHomePageSelected = false;
      });
    }
  }

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
                    _title(),
                    Expanded(
                        child: AnimatedSwitcher(
                            duration: Duration(milliseconds: 300),
                          switchInCurve: Curves.easeInToLinear,
                          switchOutCurve: Curves.easeOutBack,
                          child: isHomePageSelected ? HomePage() : Align(
                            alignment: Alignment.center,
                            child: ShoppingCartPage(),
                          ),
                        )
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
                right: 0,
                child: SizedBox(
                  width: AppTheme.fullWidth(context),
                  child: MoltenBottomNavigationBar(
                    margin: EdgeInsets.all(10),
                    borderRaduis: BorderRadius.circular(20),
                    barHeight: 70,
                    domeHeight: 20,
                    domeWidth: 120,
                    domeCircleColor: Colors.deepOrange,
                    domeCircleSize: 60,
                    borderSize: 3,
                    borderColor: Colors.white,
                    selectedIndex: _selectedIdx,
                    onTabChange: (clickedIdx) {
                        _selectedIdx = clickedIdx;
                        onBottomIconPressed(clickedIdx);
                      },
                    tabs: [
                      MoltenTab(
                        icon: Icon(Icons.home, size: 35),
                        // selectedColor: Colors.yellow,
                      ),
                      MoltenTab(
                        icon: Icon(Icons.search, size: 35),
                        // selectedColor: Colors.yellow,
                      ),
                      MoltenTab(
                        icon: Icon(Icons.work, size: 35),
                        // selectedColor: Colors.yellow,
                      ),
                      MoltenTab(
                        icon: Icon(Icons.favorite_outline, size: 35),
                        // selectedColor: Colors.yellow,
                      ),
                    ],
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
  Widget _appBar() {
    return Container(
      margin: AppTheme.padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RotatedBox(
              quarterTurns: 4,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                color: Theme.of(context).backgroundColor,
                boxShadow: AppTheme.shadow,
              ),
              child: const Icon(Icons.sort, size: 30, color: Colors.black54),
            ).ripple(() {}, borderRadius: const BorderRadius.all(Radius.circular(13))),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(13),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xfff8f8f8),
                    blurRadius: 10,
                    spreadRadius: 10
                  )
                ],
              ),
              child: Image.asset('assets/user.png'),
            ),
          ).ripple(() {}, borderRadius: const BorderRadius.all(Radius.circular(13)))
        ],
      ),
    );
  }

  Widget _title() {
    return Container(
      margin: AppTheme.padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isHomePageSelected ? 'Our' : 'Shopping',
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w400
                ),
              ),
              Text(
                isHomePageSelected ? 'Product' : 'Cart',
                style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w700
                ),
              ),


            ],
          ),
          !isHomePageSelected ?
          Container(
            padding: const EdgeInsets.all(10),
            child: const Icon(Icons.delete_outline, size: 30, color: Colors.orangeAccent),
          ).ripple(() {}, borderRadius: const BorderRadius.all(Radius.circular(13))) : SizedBox()
        ],
      ),
    );
  }
}
