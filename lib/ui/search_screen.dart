import 'package:cari_tim_flutter/util/c_color.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  ScrollController _scrollController = ScrollController();

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
                            "Search",
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
            Container(
              margin: EdgeInsets.symmetric(vertical: 22, horizontal: 30),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: CColor.orangeColor,
                    ),
                    borderRadius: BorderRadius.circular(1000),
                  ),
                  fillColor: CColor.whiteColor,
                  filled: true,
                  hintText: "Search Place",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Color(0xff515151).withOpacity(0.38),
                  ),
                  suffixIcon: Icon(
                    Icons.search,
                    color: CColor.orangeColor,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                controller: _scrollController,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: 30,
                      right: 30,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Popular",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                "Refresh",
                                style: TextStyle(
                                  color: CColor.orangeColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: CColor.orangeColor,
                              ),
                              child: Text(
                                "1",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 10,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 17,
                            ),
                            Expanded(
                              child: Text(
                                "Gemastik XV",
                                maxLines: 1,
                                style: TextStyle(
                                  color: Color(0xff3D4048).withOpacity(0.88),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 26, horizontal: 30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "History",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                "Delete All",
                                style: TextStyle(
                                  color: CColor.orangeColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Wrap(
                          spacing: 11,
                          runSpacing: 18,
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Color(0xffC4C4C4).withOpacity(0.55),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Lomba IFEST Unpad",
                                    style: TextStyle(
                                      color: Color(0xff3D4048),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Icon(
                                    Icons.close,
                                    color: Color(0xff3D4048),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Color(0xffC4C4C4).withOpacity(0.55),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Lomba IFEST Unpad",
                                    style: TextStyle(
                                      color: Color(0xff3D4048),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Icon(
                                    Icons.close,
                                    color: Color(0xff3D4048),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Color(0xffC4C4C4).withOpacity(0.55),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Lomba IFEST Unpad",
                                    style: TextStyle(
                                      color: Color(0xff3D4048),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Icon(
                                    Icons.close,
                                    color: Color(0xff3D4048),
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
          ],
        ),
      ),
    );
  }
}
