import 'package:cari_tim_flutter/util/c_color.dart';
import 'package:flutter/material.dart';

class Business extends StatefulWidget {
  const Business({Key? key}) : super(key: key);

  @override
  _BusinessState createState() => _BusinessState();
}

class _BusinessState extends State<Business> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 20, top: 30),
            child: Row(
              children: [
                Text(
                  "Businnes Project",
                  style: TextStyle(
                      fontSize: 25,
                      color: CColor.purpleColor,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 70),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.filter_list,
                      color: CColor.purpleColor,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 10),
          Column(
            children: [
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text(
                          "Gemastik 2021",
                          style: TextStyle(
                              color: CColor.whiteColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text("Looking for : UIUX Designer",
                            style: TextStyle(color: CColor.whiteColor),
                            textAlign: TextAlign.left),
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Container(
                            color: Colors.transparent,
                          )),
                          Padding(
                              padding:
                                  const EdgeInsets.only(right: 10, top: 20),
                              child: MaterialButton(
                                height: 40.0,
                                minWidth: 100.0,
                                color: CColor.purpleColor,
                                textColor: Colors.white,
                                child: new Text("See detail"),
                                onPressed: () => {},
                                splashColor: CColor.whiteColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(right: 30, top: 20),
                            child: MaterialButton(
                              height: 40.0,
                              minWidth: 70.0,
                              color: Colors.red,
                              textColor: Colors.white,
                              child: new Image.asset(
                                'assets/paperplane.png',
                                width: 20,
                                height: 20,
                              ),
                              onPressed: () => {},
                              splashColor: Colors.redAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  elevation: 5,
                  shadowColor: CColor.greyColor,
                  color: CColor.orangeColor,
                  margin: EdgeInsets.all(20),
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.white)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
