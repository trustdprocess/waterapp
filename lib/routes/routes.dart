import 'package:flutter/material.dart';
import 'package:waterapp/homepage/homepage.dart';
import 'package:waterapp/login/login.dart';
import 'package:waterapp/screens/freshwater/freshwater.dart';
import 'package:waterapp/screens/globalwarming/warmingquiz.dart';
import 'package:waterapp/screens/Impact/Impact.dart';
import 'package:waterapp/screens/watercycle/watercycle.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => loginpage());
      case "/home":
        return MaterialPageRoute(builder: (_) => homepage());
        case"/watersystem":
        return MaterialPageRoute(builder: (_) => watercycle());
          case"/freshwater":
        return MaterialPageRoute(builder: (_) => freshwater());
        case "/globalwarming":
         return MaterialPageRoute(builder: (_) => globalwarming());
         case"/solution":
          return MaterialPageRoute(builder: (_) => solution());


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
