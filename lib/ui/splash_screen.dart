import 'dart:async';

import 'package:cari_tim_flutter/ui/intro_screen.dart'; //prefix/foldername/file name
import 'package:cari_tim_flutter/util/c_color.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget { //class SplashScreen kenapa stateful karena widget tidak bisa diubah
  const SplashScreen({Key? key}) : super(key: key); //mendeklarasikan parameter splashscreen dengan value

  @override
  _SplashScreenState createState() => _SplashScreenState(); //membuat objek state
}

class _SplashScreenState extends State<SplashScreen> { //class _splashscreen dari induk splashscreen
  @override
  Widget build(BuildContext context) { //kerangka untuk widget
    return Scaffold( //stuktur tampilan
      backgroundColor: CColor.whiteColor,
      body: Center( //menaruh gambar ditengah layar
        child: Container(
          width: MediaQuery.of(context).size.width / 2, //ukuran lebarnya dibagi 2
          child: Image.asset(  //untuk menampilkan gambar dari asset
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
