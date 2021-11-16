import 'package:cari_tim_flutter/util/c_color.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColor.whiteColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/app_bar_bg.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hello James!",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24,
                                  color: CColor.whiteColor,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Let’s find new project experience",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: CColor.whiteColor.withOpacity(0.61),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 8,
                          height: MediaQuery.of(context).size.width / 8,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                blurRadius: 5,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(11),
                          ),
                          fillColor: CColor.whiteColor,
                          filled: true,
                          hintText: "Search Place",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Color(0xff485696),
                          ),
                          suffixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Text(
                "Project Category",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                  color: Color(0xff485696),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 5,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 24),
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.height,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: AssetImage("assets/app_bar_bg.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.asset(
                            "assets/item_category.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Contest Project",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: CColor.whiteColor,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 8,
                  );
                },
                itemCount: 5,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Text(
                "Recommended Project",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                  color: Color(0xff485696),
                ),
              ),
            ),
            ListView.separated(
              controller: _scrollController,
              padding: EdgeInsets.symmetric(vertical: 16),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 14),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    image: DecorationImage(
                      image: AssetImage("assets/app_bar_bg.png"),
                      fit: BoxFit.fill,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        offset: Offset(3, 3),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Business Project",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 10,
                                color: CColor.whiteColor.withOpacity(0.56),
                              ),
                            ),
                            Text(
                              "Proyek Web Jasapedia",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 13,
                                color: CColor.whiteColor,
                              ),
                            ),
                            SizedBox(height: 4,),
                            RichText(
                              text: TextSpan(
                                text: "Team Name : ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                  color: CColor.whiteColor,
                                ),
                                children: [
                                  TextSpan(
                                    text: "FAAB Team",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 10,
                                      color: CColor.whiteColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 3,),
                            RichText(
                              text: TextSpan(
                                text: "Note : ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                  color: CColor.whiteColor,
                                ),
                                children: [
                                  TextSpan(
                                    text: "Dicari Frontend dev dengan kempaun dalam mengoperasikan React JS",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 10,
                                      color: CColor.whiteColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "View Detail",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 10,
                            color: CColor.whiteColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 14,
                );
              },
              itemCount: 5,
            ),
          ],
        ),
      ),
    );
  }
}
