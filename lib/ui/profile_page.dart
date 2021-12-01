import 'package:cari_tim_flutter/ui/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:cari_tim_flutter/util/c_color.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CColor.whiteColor,
        appBar: AppBar(
          title: Text("Profile Page"),
          backgroundColor: CColor.orangeColor,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: ListView(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Container(
                    color: CColor.orangeColor,
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Image.asset(
                            'assets/user1.png',
                            alignment: Alignment.topCenter,
                          ),
                        ),
                        Text(
                          "Farhan Gunadi",
                          style: TextStyle(
                              fontSize: 25,
                              color: CColor.whiteColor,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "ID : 140810190009",
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFFFFFF).withOpacity(0.5),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  //button
                  Container(
                    child: Column(
                      children: [
                        Container(
                          width: 300,
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 0.5,
                                blurRadius: 9,
                                offset:
                                    Offset(0, 2), // changes position of shadow
                              ),
                            ],
                          ),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditProfile()),
                              );
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: CColor.whiteColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(35),
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(35),
                                    color: Color(0x485696).withOpacity(0.4),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(Icons.person,
                                          color: Color(0x485696).withOpacity(1),
                                          size: 40),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      "Edit Profile",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                                Center(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                      Icons.keyboard_arrow_right_rounded,
                                      color: Colors.black,
                                      size: 35),
                                ))
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ), //end Button
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          width: 300,
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 0.5,
                                blurRadius: 9,
                                offset:
                                    Offset(0, 2), // changes position of shadow
                              ),
                            ],
                          ),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              backgroundColor: CColor.whiteColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(35),
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(35),
                                    color: Color(0x485696).withOpacity(0.4),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                          Icons.my_library_books_rounded,
                                          color: Color(0x485696).withOpacity(1),
                                          size: 40),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      "Project Vacancy",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                                Center(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                      Icons.keyboard_arrow_right_rounded,
                                      color: Colors.black,
                                      size: 35),
                                ))
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          width: 300,
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 0.5,
                                blurRadius: 9,
                                offset:
                                    Offset(0, 2), // changes position of shadow
                              ),
                            ],
                          ),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              backgroundColor: CColor.whiteColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(35),
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(35),
                                    color: Color(0x485696).withOpacity(0.4),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(Icons.task,
                                          color: Color(0x485696).withOpacity(1),
                                          size: 40),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      "Applied Project",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                                Center(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                      Icons.keyboard_arrow_right_rounded,
                                      color: Colors.black,
                                      size: 35),
                                ))
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          width: 300,
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 0.5,
                                blurRadius: 9,
                                offset:
                                    Offset(0, 2), // changes position of shadow
                              ),
                            ],
                          ),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              backgroundColor: CColor.whiteColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(35),
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(35),
                                    color: Color(0x485696).withOpacity(0.4),
                                  ),
                                  child: Center(
                                    child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset('assets/heart.png')),
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      "Wishlist",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                                Center(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                      Icons.keyboard_arrow_right_rounded,
                                      color: Colors.black,
                                      size: 35),
                                ))
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          width: 300,
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 0.5,
                                blurRadius: 9,
                                offset:
                                    Offset(0, 2), // changes position of shadow
                              ),
                            ],
                          ),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              backgroundColor: CColor.whiteColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(35),
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(35),
                                    color: Color(0x485696).withOpacity(0.4),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(Icons.settings,
                                          color: Color(0x485696).withOpacity(1),
                                          size: 40),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      "Settings",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                                Center(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                      Icons.keyboard_arrow_right_rounded,
                                      color: Colors.black,
                                      size: 35),
                                ))
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
