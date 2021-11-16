import 'package:cari_tim_flutter/ui/get_started_screen.dart';
import 'package:cari_tim_flutter/ui/intro_screen.dart';
import 'package:cari_tim_flutter/ui/signup_screen.dart';
import 'package:cari_tim_flutter/ui/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignupScreen(),
    );
  }
}
