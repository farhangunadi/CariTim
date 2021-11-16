import 'package:cari_tim_flutter/util/c_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isSignupScreen = true;
  bool isMale = true;
  bool isRememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColor.orangeColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 16,
            child: Container(
              padding: EdgeInsets.only(left: 40,top: 90),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children:[
                  RichText(
                    text: TextSpan(
                      text: "Login",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    height: 1,
                    width: 75,
                    color: Colors.white,
                  ),
                  Column(
                    children: [
                      Column(
                        children: [
                          Text(
                            "Register",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0,
                                color: Colors.white,
                              ),
                          ),
                          Container(
                            height: 1,
                            width: 75,
                            color: Colors.white,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),

            ),
          ),
          Positioned(
            top: 150,
            child: Container(
              height: 550,
              width: MediaQuery.of(context).size.width-40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 15,
                    spreadRadius: 5,
                  )
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}
