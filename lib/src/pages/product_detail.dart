import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/model/data.dart';
import 'package:flutter_ecommerce_app/src/themes/light_color.dart';
import 'package:flutter_ecommerce_app/src/themes/themes.dart';
import 'package:flutter_ecommerce_app/src/widgets/extentions.dart';

class ProductDetailPage extends StatefulWidget {

  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> with TickerProviderStateMixin {
  bool isLiked = true;
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
     super.initState();
     controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
     animation = Tween<double>(begin: 0, end: 1).animate(
         CurvedAnimation(parent: controller, curve: Curves.easeInToLinear));
     controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
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
              children:[ Column(
                children: [
                  _appBar(),
                  _productImage(),
                  _categoryWidget(),
                ],
              ),
                _detailWidget(),
            ]
            ),
          ),
      )
    );
  }

  Widget _detailWidget() {
    return DraggableScrollableSheet(
      initialChildSize: .53,
      minChildSize: .53,
      maxChildSize: .8,
      builder: (context, scrollController) {
        return Container(
          padding: AppTheme.padding.copyWith(bottom: 0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
              color: Colors.white
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Container(
                  alignment: Alignment.center,
                  child: Container(
                    width: 70,
                    height: 5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'NIKE AIR MAX 200',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Text('\$',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.red
                              ),
                            ),
                            Text(' 240',
                              style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.star,
                                color: LightColor.yellowColor, size: 17),
                            Icon(Icons.star,
                                color: LightColor.yellowColor, size: 17),
                            Icon(Icons.star,
                                color: LightColor.yellowColor, size: 17),
                            Icon(Icons.star,
                                color: LightColor.yellowColor, size: 17),
                            Icon(Icons.star_border, size: 17),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 20),
                _availableSize(),
                const SizedBox(height: 20),
                _availableColor(),
                const SizedBox(height: 20),
                _description(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _availableColor() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Color',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _colorWidget(Colors.orange, isSelected:true),
            const SizedBox(width: 20),
            _colorWidget(Colors.lightBlue),
            const SizedBox(width: 20),
            _colorWidget(Colors.black),
            const SizedBox(width: 20),
            _colorWidget(Colors.red),
            const SizedBox(width: 20),
            _colorWidget(Colors.cyan),
            const SizedBox(width: 20),
          ],
        )
      ],
    );
  }

  Widget _description() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          "Available Size",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(height: 15),
        Text(
            AppData.description,
          style: const TextStyle(
            color: Colors.grey,
            height: 1.8
          )
        ),
      ],
    );
  }

  Widget _colorWidget(Color color, {isSelected=false}) {
    return CircleAvatar(
      radius: 18,
      backgroundColor: color.withAlpha(50),
      child: isSelected ? Icon(
        Icons.check_circle,
        color: color,
        size: 20,
      )
          : CircleAvatar(radius: 10, backgroundColor: color),
    );
  }

  Widget _availableSize() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Available Size',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _sizeWidget("US 6"),
            _sizeWidget("US 7", isSelected:true),
            _sizeWidget("US 8"),
            _sizeWidget("US 9"),
          ],
        )
      ],
    );
  }

  Widget _sizeWidget(String size, {isSelected=false}) {
    return Container(
      width: 65,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: isSelected ? LightColor.orange : Colors.grey
        ),
        color: isSelected ? LightColor.orange : Colors.white
      ),
      child: Center(
        child: Text(
          size,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : Colors.black87
          ),
        ),
      ),
    );
  }

  Widget _categoryWidget() {
    return SizedBox(
      height: 80,
      width: AppTheme.fullWidth(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: AppData.showThumbnailList.map((image) => _thumbnail(image)).toList()),
      );
  }

  Widget _thumbnail(String image) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return AnimatedOpacity(
            opacity: animation.value,
            duration: const Duration(milliseconds: 500),
          child: child,
        );
      },
      child: Container(
        width: 60,
        height: 48,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1,
            color: Colors.grey
          )
        ),
        child: Image.asset(image),
      ),
    );
  }
  
  Widget _productImage() {
    return AnimatedBuilder(
      builder: (context, child) {
        return AnimatedOpacity(
            opacity: animation.value,
            duration: const Duration(milliseconds: 500),
          child: child,
        );
      },
      animation: animation,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          const Text(
            "AIP",
            style: TextStyle(
              fontSize: 160,
              fontWeight: FontWeight.bold,
              color: LightColor.lightGrey
            ),
          ),
          Image.asset("assets/show_1.png")
        ],
      ),
    );
  }

  Widget _appBar() {
    return Container(
        margin: AppTheme.padding,
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
            isLiked ? Icons.favorite : Icons.favorite_outline,
            color: isLiked ? LightColor.red : LightColor.grey,
            isOutLine: false,
            onPressed: () {
              setState(() {
                isLiked = !isLiked;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _icon(IconData icon, {
    Color color = LightColor.iconColor,
    bool isOutLine = false,
    Function? onPressed,
  }) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(
          color: LightColor.iconColor,
          style: isOutLine ? BorderStyle.solid : BorderStyle.none
        ),
        borderRadius: BorderRadius.circular(15),
        color:
          isOutLine ? Colors.transparent : Colors.white,
      ),
      child: Icon(icon, size: 24, color: color),
    ).ripple(() {
      if(onPressed != null) {
        onPressed();
      }
    }, borderRadius: BorderRadius.circular(15));
  }
}
