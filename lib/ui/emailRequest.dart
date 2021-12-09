import 'package:cari_tim_flutter/model/api_service.dart';
import 'package:cari_tim_flutter/ui/otpPassword.dart';
import 'package:cari_tim_flutter/util/c_color.dart';
import 'package:flutter/material.dart';

class EmailReq extends StatefulWidget {
  const EmailReq({Key? key}) : super(key: key);

  @override
  State<EmailReq> createState() => _EmailReqState();
}

class _EmailReqState extends State<EmailReq> {
  TextEditingController emailController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CColor.whiteColor,
        elevation: 0,
        title: Text(
          "Forget Password",
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.10),
                      blurRadius: 17,
                    ),
                  ],
                ),
                child: TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Enter your email",
                    filled: true,
                    fillColor: CColor.whiteColor,
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 11,
                      color: Color(0xff959595),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: TextButton(
                  onPressed: () async {
                    String email = emailController.text;
                    var rsp = await verifyOTPpass(email);
                    print(rsp);
                    if (rsp.containsKey('data')) {
                      if (rsp['data'] != null) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return OtpPass();
                        }));
                      }
                    }
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: CColor.purpleColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
