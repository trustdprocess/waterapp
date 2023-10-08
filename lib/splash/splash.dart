import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:waterapp/homepage/homepage.dart';



class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  bool _animationPlayed = false;

  @override
  void initState() {
    super.initState();
    if (!_animationPlayed) {
      Future.delayed(Duration(seconds: 3)).then((value) {
        setState(() {
          _animationPlayed = true;
        });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => homepage()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_animationPlayed) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => homepage()),
          );
        }
        return true;
      },
      child: Scaffold(
        body: _animationPlayed
            ? homepage()
            : Center(
                child: Container(
                  height: 200,
                  width: 200,
                  child: Lottie.asset("assets/animation_lngh473g.json"),
                ),
              ),
      ),
    );
  }
}