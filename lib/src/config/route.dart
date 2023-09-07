import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/pages/home_page.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoute() {
    return {
      '/': (_) => HomePage(),
    };
  }
}