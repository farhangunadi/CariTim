import 'dart:math';

import 'package:cari_tim_flutter/model/DataModel.dart';
import 'package:cari_tim_flutter/model/api_service.dart';
import 'package:cari_tim_flutter/ui/auth_screen.dart';
import 'package:cari_tim_flutter/ui/changePass.dart';
import 'package:cari_tim_flutter/ui/home_screen.dart';
import 'package:cari_tim_flutter/util/c_color.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpPass extends StatefulWidget {
  const OtpPass({Key? key}) : super(key: key);

  @override
  _OtpPassState createState() => _OtpPassState();
}

class _OtpPassState extends State<OtpPass> {
  TextEditingController otpController = new TextEditingController();
  TextEditingController passController = new TextEditingController();
  TextEditingController confpassController = new TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: CColor.whiteColor,
          elevation: 0,
          title: Text(
            "OTP Verification",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: CColor.orangeColor),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: CColor.orangeColor,
            ),
          ),
        ),
        body: ListView(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Image.asset('assets/secure.png'),
                      SizedBox(height: 40),
                      Text(
                        "Check your email to see the OTP code and input it to the field",
                        style: TextStyle(color: CColor.greyColor, fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: otpController,
                        decoration: InputDecoration(
                          hintText: "Input your OTP Code",
                          filled: true,
                          fillColor: CColor.whiteColor,
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: passController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: _obscurePassword,
                        decoration: InputDecoration(
                          hintText: "Enter New Password",
                          filled: true,
                          fillColor: CColor.whiteColor,
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              size: 14,
                              color: CColor.orangeColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: confpassController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: _obscurePassword,
                        decoration: InputDecoration(
                          hintText: "Confirm New Password",
                          filled: true,
                          fillColor: CColor.whiteColor,
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              size: 14,
                              color: CColor.orangeColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: TextButton(
                          onPressed: () async {
                            String otp = otpController.text;
                            String pass = passController.text;
                            if (pass == confpassController.text) {
                              var rsp = await changePass(otp, pass);
                              print(rsp);
                              if (rsp.containsKey('data')) {
                                if (rsp['data'] != null) {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return AuthScreen();
                                  }));
                                }
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    // return object of type Dialog
                                    return AlertDialog(
                                      title: new Text(
                                          "Sorry! your OTP code is wrong "),
                                      content: new Text(
                                          "Please check again your OTP code!"),
                                      actions: <Widget>[
                                        // usually buttons at the bottom of the dialog
                                        new TextButton(
                                          child: new Text("Close"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            } else {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  // return object of type Dialog
                                  return AlertDialog(
                                    title: new Text(
                                        "Sorry! your password is not same"),
                                    content: new Text("Please enter again!"),
                                    actions: <Widget>[
                                      // usually buttons at the bottom of the dialog
                                      new TextButton(
                                        child: new Text("Close"),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: CColor.purpleColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text(
                            "Submit",
                            style: TextStyle(
                              color: CColor.whiteColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
