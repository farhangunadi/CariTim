import 'package:cari_tim_flutter/util/c_color.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  List<String> _titleList = ["Privacy Policy", "Terms of Service", "Information", "Language"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColor.whiteColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/app_bar_bg.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: SafeArea(
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_back,
                        color: CColor.whiteColor,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Center(
                          child: Text(
                            "Setting",
                            style: TextStyle(
                              color: CColor.whiteColor,
                              fontSize: 21,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      splashColor: Colors.transparent,
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.transparent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 16),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: ExpandablePanel(
                      theme: ExpandableThemeData(
                        iconColor: Color(0xff000000).withOpacity(0.34),
                        animationDuration: Duration(
                          milliseconds: 500,
                        ),
                        hasIcon: true,
                        tapBodyToCollapse: true,
                        tapBodyToExpand: true,
                        tapHeaderToExpand: true,
                        bodyAlignment:
                        ExpandablePanelBodyAlignment.center,
                        headerAlignment:
                        ExpandablePanelHeaderAlignment.center,
                      ),
                      header: Text(
                        _titleList[index],
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                      collapsed: Container(),
                      expanded: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "Setter",
                          style: TextStyle(
                            color:
                            Color(0xff27292C).withOpacity(0.57),
                            fontWeight: FontWeight.w500,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(height: 8,),
                      Divider(
                        color: Color(0xff515151).withOpacity(0.34),
                      ),
                      SizedBox(height: 8,),
                    ],
                  );
                },
                itemCount: _titleList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
