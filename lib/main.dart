import 'package:cari_tim_flutter/ui/auth_screen.dart';
import 'package:cari_tim_flutter/ui/get_started_screen.dart';
import 'package:cari_tim_flutter/ui/home_screen.dart';
import 'package:cari_tim_flutter/ui/intro_screen.dart';
import 'package:cari_tim_flutter/ui/notification_screen.dart';
import 'package:cari_tim_flutter/ui/profile_page.dart';
import 'package:cari_tim_flutter/ui/setting_screen.dart';
import 'package:cari_tim_flutter/ui/splash_screen.dart';
import 'package:cari_tim_flutter/ui/edit_profile.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); //fungsi untuk menjalankan app
}

class MyApp extends StatelessWidget {
  //class dari app yang menjalankan widget statis yang tidak bisa diubah hanya bisa dilihat
  const MyApp({Key? key})
      : super(key: key); //mendeklrasikan parameter dengan value

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
