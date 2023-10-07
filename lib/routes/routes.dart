import 'package:flutter/material.dart';
import 'package:waterapp/homepage/homepage.dart';
import 'package:waterapp/login/login.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => loginpage());
      case "/home":
        return MaterialPageRoute(builder: (_) => homepage());
      default:
        return MaterialPageRoute(builder: (_) => error());
    }
  }
}

Widget error() {
  return Scaffold(
    appBar: AppBar(title: Text("Error!"),),
  );
}
