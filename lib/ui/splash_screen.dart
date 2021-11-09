import 'dart:async';

import 'package:cari_tim_flutter/ui/intro_screen.dart';
import 'package:cari_tim_flutter/util/c_color.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColor.whiteColor,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          child: Image.asset(
            "assets/logo.png",
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => IntroScreen(),
          ),
          (route) => false);
    });
  }
}
