import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/pages/main_page.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoute() {
    return {
      '/': (_) => MainPage(),
    };
  }
}