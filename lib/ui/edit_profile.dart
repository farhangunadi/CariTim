import 'package:cari_tim_flutter/model/api_service.dart';
import 'package:cari_tim_flutter/ui/home_screen.dart';
import 'package:cari_tim_flutter/util/c_color.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController dateCtl = TextEditingController();
  TextEditingController fnameCtl = TextEditingController();
  TextEditingController snameCtl = TextEditingController();
  TextEditingController jobCtl = TextEditingController();
  TextEditingController phoneNumCtl = TextEditingController();

  late SharedPreferences sharedPreferences;
  String id = "";
  String token = "";
  bool _isLoading = false;

  void getPreference() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      id = sharedPreferences.getString("id");
      token = sharedPreferences.getString("token");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPreference();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColor.orangeColor,
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.only(top: 30),
          child: _isLoading
              ? Center(child: CircularProgressIndicator())
              : SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Column(
                          children: [
                            Container(child: Image.asset('assets/user1.png')),
                            MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              color: CColor.purpleColor,
                              child: Text(
                                "Change Photo",
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          children: [
                            Container(
                                margin: EdgeInsets.only(
                                  left: 32,
                                  right: 32,
                                  bottom: 32,
                                  top: 12,
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
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text("First name"),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black
                                                  .withOpacity(0.15),
                                              blurRadius: 17,
                                            ),
                                          ],
                                        ),
                                        child: TextFormField(
                                          controller: fnameCtl,
                                          decoration: InputDecoration(
                                            hintText: "Your First Name",
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
                                        height: 20,
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text("Surname"),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black
                                                  .withOpacity(0.15),
                                              blurRadius: 17,
                                            ),
                                          ],
                                        ),
                                        child: TextFormField(
                                          controller: snameCtl,
                                          decoration: InputDecoration(
                                            hintText: "Your Surname",
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
                                        height: 20,
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text("Date of Birth"),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.15),
                                                blurRadius: 17,
                                              ),
                                            ],
                                          ),
                                          child: TextFormField(
                                            controller: dateCtl,
                                            decoration: InputDecoration(
                                              hintText: "Date of birth",
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
                                            onTap: () async {
                                              DateTime? date = DateTime(1900);
                                              FocusScope.of(context)
                                                  .requestFocus(
                                                      new FocusNode());

                                              date = await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime(1900),
                                                  lastDate: DateTime(2100));

                                              dateCtl.text = DateFormat.yMMMEd()
                                                  .format(date!);
                                            },
                                          )),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text("Job"),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black
                                                  .withOpacity(0.15),
                                              blurRadius: 17,
                                            ),
                                          ],
                                        ),
                                        child: TextFormField(
                                          controller: jobCtl,
                                          decoration: InputDecoration(
                                            hintText: "Your Job",
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
                                        height: 10,
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text("Phone number"),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black
                                                  .withOpacity(0.15),
                                              blurRadius: 17,
                                            ),
                                          ],
                                        ),
                                        child: TextFormField(
                                          controller: phoneNumCtl,
                                          decoration: InputDecoration(
                                            hintText: "Phone number",
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
                                        height: 20,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 50,
                                        child: TextButton(
                                          onPressed: () async {
                                            var fname = fnameCtl.text;
                                            var sname = snameCtl.text;
                                            var birthDate = dateCtl.text;
                                            var job = jobCtl.text;
                                            var phoneNumber = phoneNumCtl.text;
                                            var rsp = await editProfile(
                                                id,
                                                fname,
                                                sname,
                                                birthDate,
                                                job,
                                                phoneNumber,
                                                token);
                                            print(rsp);
                                            print(id);
                                            if (rsp.containsKey('data')) {
                                              setState(() {});
                                              if (rsp['data'] != null) {
                                                _isLoading = false;
                                                Navigator.of(context)
                                                    .pushAndRemoveUntil(
                                                        MaterialPageRoute(
                                                            builder: (BuildContext
                                                                    context) =>
                                                                HomeScreen()),
                                                        (Route<dynamic>
                                                                route) =>
                                                            false);
                                              }
                                            } else {
                                              _isLoading = false;
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  // return object of type Dialog
                                                  return AlertDialog(
                                                    title: new Text(
                                                        "Edit Profile Failed"),
                                                    content: new Text(
                                                        "Please Try Again!"),
                                                    actions: <Widget>[
                                                      // usually buttons at the bottom of the dialog
                                                      new TextButton(
                                                        child:
                                                            new Text("Close"),
                                                        onPressed: () {
                                                          Navigator.of(context).pushAndRemoveUntil(
                                                              MaterialPageRoute(
                                                                  builder: (BuildContext
                                                                          context) =>
                                                                      EditProfile()),
                                                              (Route<dynamic>
                                                                      route) =>
                                                                  false);
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
                                            "Save",
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
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                )),
    );
  }
}
