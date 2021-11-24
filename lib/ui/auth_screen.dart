import 'package:cari_tim_flutter/util/c_color.dart';
import 'package:cari_tim_flutter/model/api_service.dart';
import 'package:cari_tim_flutter/ui/home_screen.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  bool _obscurePassword = true;

  TextEditingController emailController = new TextEditingController();
  TextEditingController passController = new TextEditingController();
  String message = 'not login';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColor.whiteColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            SizedBox.expand(
              child: Image.asset(
                "assets/auth_bg.png",
                fit: BoxFit.fill,
              ),
            ),
            SafeArea(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 55,
                        vertical: 20,
                      ),
                      child: TabBar(
                        indicatorSize: TabBarIndicatorSize.label,
                        controller: _tabController,
                        labelStyle: TextStyle(
                          color: CColor.whiteColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                        indicatorColor: CColor.whiteColor,
                        isScrollable: true,
                        tabs: [
                          Tab(
                            text: "Login",
                          ),
                          Tab(
                            text: "Register",
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          ListView(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  left: 32,
                                  right: 32,
                                  bottom: 32,
                                ),
                                padding: EdgeInsets.all(24),
                                decoration: BoxDecoration(
                                  color: CColor.whiteColor,
                                  borderRadius: BorderRadius.circular(19),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.25),
                                      blurRadius: 27,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Sign In",
                                      style: TextStyle(
                                        color: CColor.purpleColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 35,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      "Login to your account",
                                      style: TextStyle(
                                        color: Color(0xff707070),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 11,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 44,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.25),
                                            blurRadius: 17,
                                          ),
                                        ],
                                      ),
                                      child: TextFormField(
                                        controller: emailController,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                          hintText: "Email",
                                          filled: true,
                                          fillColor: CColor.whiteColor,
                                          hintStyle: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 11,
                                            color: Color(0xff959595),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 21,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.25),
                                            blurRadius: 17,
                                          ),
                                        ],
                                      ),
                                      child: TextFormField(
                                        controller: passController,
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        obscureText: _obscurePassword,
                                        decoration: InputDecoration(
                                          hintText: "Password",
                                          filled: true,
                                          fillColor: CColor.whiteColor,
                                          suffixIcon: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                _obscurePassword =
                                                    !_obscurePassword;
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
                                          hintStyle: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 11,
                                            color: Color(0xff959595),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            "Forgot Password?",
                                            style: TextStyle(
                                              color: CColor.purpleColor,
                                              fontSize: 8,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: TextButton(
                                        onPressed: () async {
                                          var email = emailController.text;
                                          var pass = passController.text;
                                          setState(() {
                                            message = 'Please Wait...';
                                          });
                                          var rsp =
                                              await loginUser(email, pass);
                                          print(rsp);
                                          if (rsp.containsKey('data')) {
                                            setState(() {
                                              message = 'Login Success';
                                            });
                                            if (rsp['data'] != null) {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return HomeScreen();
                                              }));
                                            }
                                          } else {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                // return object of type Dialog
                                                return AlertDialog(
                                                  title:
                                                      new Text("Login Failed"),
                                                  content: new Text(
                                                      "Email or password are not correct!"),
                                                  actions: <Widget>[
                                                    // usually buttons at the bottom of the dialog
                                                    new TextButton(
                                                      child: new Text("Close"),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                        ),
                                        child: Text(
                                          "Login",
                                          style: TextStyle(
                                            color: CColor.whiteColor,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Divider(
                                            color: Color(0xffB6B6B6),
                                          ),
                                        ),
                                        Text(
                                          "or continue with",
                                          style: TextStyle(
                                            color: Color(0xffB6B6B6),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 11,
                                          ),
                                        ),
                                        Expanded(
                                          child: Divider(
                                            color: Color(0xffB6B6B6),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    InkWell(
                                      borderRadius: BorderRadius.circular(7),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        padding: EdgeInsets.all(11),
                                        decoration: BoxDecoration(
                                          color: CColor.whiteColor,
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black
                                                  .withOpacity(0.25),
                                              blurRadius: 17,
                                            ),
                                          ],
                                        ),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              "assets/google_icon.png",
                                              width: 22,
                                              height: 22,
                                            ),
                                            Expanded(
                                              child: Center(
                                                child: Text(
                                                  "Continue with Google",
                                                  style: TextStyle(
                                                    color: Color(0xff959595),
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 11,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Visibility(
                                              visible: false,
                                              child: Image.asset(
                                                "assets/google_icon.png",
                                                width: 22,
                                                height: 22,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          ListView(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  left: 32,
                                  right: 32,
                                  bottom: 32,
                                ),
                                padding: EdgeInsets.all(24),
                                decoration: BoxDecoration(
                                  color: CColor.whiteColor,
                                  borderRadius: BorderRadius.circular(19),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.25),
                                      blurRadius: 27,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Register",
                                      style: TextStyle(
                                        color: CColor.purpleColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 35,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      "Create your account",
                                      style: TextStyle(
                                        color: Color(0xff707070),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 11,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 44,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.25),
                                            blurRadius: 17,
                                          ),
                                        ],
                                      ),
                                      child: TextFormField(
                                        keyboardType: TextInputType.name,
                                        decoration: InputDecoration(
                                          hintText: "Username",
                                          filled: true,
                                          fillColor: CColor.whiteColor,
                                          hintStyle: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 11,
                                            color: Color(0xff959595),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 21,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.25),
                                            blurRadius: 17,
                                          ),
                                        ],
                                      ),
                                      child: TextFormField(
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                          hintText: "Email Address",
                                          filled: true,
                                          fillColor: CColor.whiteColor,
                                          hintStyle: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 11,
                                            color: Color(0xff959595),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 21,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.25),
                                            blurRadius: 17,
                                          ),
                                        ],
                                      ),
                                      child: TextFormField(
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        obscureText: _obscurePassword,
                                        decoration: InputDecoration(
                                          hintText: "Password",
                                          filled: true,
                                          fillColor: CColor.whiteColor,
                                          suffixIcon: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                _obscurePassword =
                                                    !_obscurePassword;
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
                                          hintStyle: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 11,
                                            color: Color(0xff959595),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 21,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.25),
                                            blurRadius: 17,
                                          ),
                                        ],
                                      ),
                                      child: TextFormField(
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        obscureText: _obscurePassword,
                                        decoration: InputDecoration(
                                          hintText: "Confirm Password",
                                          filled: true,
                                          fillColor: CColor.whiteColor,
                                          suffixIcon: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                _obscurePassword =
                                                    !_obscurePassword;
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
                                          hintStyle: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 11,
                                            color: Color(0xff959595),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            "Forgot Password?",
                                            style: TextStyle(
                                              color: CColor.purpleColor,
                                              fontSize: 8,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: TextButton(
                                        onPressed: () {},
                                        style: TextButton.styleFrom(
                                          backgroundColor: CColor.purpleColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                        ),
                                        child: Text(
                                          "Register",
                                          style: TextStyle(
                                            color: CColor.whiteColor,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Divider(
                                            color: Color(0xffB6B6B6),
                                          ),
                                        ),
                                        Text(
                                          "or continue with",
                                          style: TextStyle(
                                            color: Color(0xffB6B6B6),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 11,
                                          ),
                                        ),
                                        Expanded(
                                          child: Divider(
                                            color: Color(0xffB6B6B6),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    InkWell(
                                      borderRadius: BorderRadius.circular(7),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        padding: EdgeInsets.all(11),
                                        decoration: BoxDecoration(
                                          color: CColor.whiteColor,
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black
                                                  .withOpacity(0.25),
                                              blurRadius: 17,
                                            ),
                                          ],
                                        ),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              "assets/google_icon.png",
                                              width: 22,
                                              height: 22,
                                            ),
                                            Expanded(
                                              child: Center(
                                                child: Text(
                                                  "Register with Google",
                                                  style: TextStyle(
                                                    color: Color(0xff959595),
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 11,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Visibility(
                                              visible: false,
                                              child: Image.asset(
                                                "assets/google_icon.png",
                                                width: 22,
                                                height: 22,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
