import 'package:cari_tim_flutter/ui/get_started_screen.dart';
import 'package:cari_tim_flutter/util/c_color.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  //
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int _selectedContent = 0; //memulai dari content awal

  List<Map<String, String>> _listContent = [
    //mapping array ngerutkan konten
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
      //struktur tampilan
      backgroundColor: CColor.whiteColor,
      body: SafeArea(
        //supaya content tidak keluar widget
        child: Container(
          width: MediaQuery.of(context).size.width, //untuk mengatur lebar media
          height:
              MediaQuery.of(context).size.height, // untuk mengatur tinggi media
          child: Column(
            //untuk mengatur vertikal widget
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2,
                child: Image.asset(
                  //mengambil dari folder asset
                  _listContent[_selectedContent]["image"]!,
                  fit: BoxFit.fill,
                ),
              ),
              Row(
                //untuk mengatur horizontal widget
                mainAxisAlignment:
                    MainAxisAlignment.center, //menaruh konten ditengah
                children: [
                  Container(
                    height: 5,
                    width: _selectedContent ==
                            0 //untuk pilih konten untuk tampilkkan
                        ? MediaQuery.of(context).size.width /
                            6.4 // operator if else
                        : MediaQuery.of(context).size.width /
                            20, // operator if else
                    margin: EdgeInsets.symmetric(horizontal: 3),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(5), //ukuran dari ituan
                      color: _selectedContent == 0 //dimulai dari screen awal
                          ? CColor.orangeColor
                          : CColor.creamColor,
                    ),
                  ),
                  Container(
                    height: 5,
                    width: _selectedContent == 1 //untuk pilih konten
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
                onPressed: () {
                  if (_selectedContent != 1) {
                    //untuk memilih skip ke berapa
                    setState(() {
                      _selectedContent++; //ketika diklik akan lanjut 1 page
                    });
                  } else {
                    Navigator.push(
                        //untuk melanjutkan ke screen berikutnya
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              GetStartedScreen(), //screen dari get_started_screen
                        ));
                  }
                },
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
                  if (_selectedContent != 0) {
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
                  "Next", //sama ini untuk nextnya
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
