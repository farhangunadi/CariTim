import 'package:cari_tim_flutter/ui/get_started_screen.dart';
import 'package:cari_tim_flutter/util/c_color.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int _selectedContent = 0;

  List<Map<String, String>> _listContent = [
    {
      "image": "assets/scene_1.png",
      "title": "Improve your skill with new team experience",
      "subtitle":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed lorem accumsan, dolor vel, amet, donec fringilla commodo. Morbi commodo ut libero urna, senectus faucibus sit pharetra.",
    },
    {
      "image": "assets/scene_2.png",
      "title": "Find your member for do some project",
      "subtitle":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed lorem accumsan, dolor vel, amet, donec fringilla commodo. Morbi commodo ut libero urna, senectus faucibus sit pharetra.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColor.whiteColor,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2,
                child: Image.asset(
                  _listContent[_selectedContent]["image"]!,
                  fit: BoxFit.fill,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 5,
                    width: _selectedContent == 0
                        ? MediaQuery.of(context).size.width / 6.4
                        : MediaQuery.of(context).size.width / 20,
                    margin: EdgeInsets.symmetric(horizontal: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: _selectedContent == 0
                          ? CColor.orangeColor
                          : CColor.creamColor,
                    ),
                  ),
                  Container(
                    height: 5,
                    width: _selectedContent == 1
                        ? MediaQuery.of(context).size.width / 6.4
                        : MediaQuery.of(context).size.width / 20,
                    margin: EdgeInsets.symmetric(horizontal: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: _selectedContent == 1
                          ? CColor.orangeColor
                          : CColor.creamColor,
                    ),
                  ),
                  Container(
                    height: 5,
                    width: MediaQuery.of(context).size.width / 20,
                    margin: EdgeInsets.symmetric(horizontal: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: CColor.creamColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 18,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 22,
                      ),
                      child: Text(
                        _listContent[_selectedContent]["title"]!,
                        style: TextStyle(
                          color: CColor.purpleColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 22,
                      ),
                      child: Text(
                        _listContent[_selectedContent]["subtitle"]!,
                        style: TextStyle(
                          color: CColor.greyColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 23,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(30),
        child: Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Skip Now",
                  style: TextStyle(
                    color: CColor.purpleColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {
                  if (_selectedContent != 1) {
                    setState(() {
                      _selectedContent++;
                    });
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GetStartedScreen(),
                        ));
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: CColor.purpleColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Text(
                  "Next",
                  style: TextStyle(
                    color: CColor.whiteColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
