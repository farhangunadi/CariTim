import 'package:cari_tim_flutter/util/c_color.dart';
import 'package:cari_tim_flutter/ui/business.dart' as business;
import 'package:cari_tim_flutter/ui/competition.dart' as competition;
import 'package:cari_tim_flutter/ui/otherProject.dart' as other;
import 'package:flutter/material.dart';

class ProjectDisc2 extends StatefulWidget {
  const ProjectDisc2({Key? key}) : super(key: key);

  @override
  _ProjectDisc2State createState() => _ProjectDisc2State();
}

class _ProjectDisc2State extends State<ProjectDisc2>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  void initState() {
    controller = TabController(vsync: this, length: 3);
    //tambahkan SingleTickerProviderStateMikin pada class _HomeState
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: CColor.whiteColor,
          ),
        ),
        //warna background
        backgroundColor: CColor.orangeColor,
        //judul
        title: new Text("Project Discovery "),
        //bottom
        bottom: new TabBar(
          controller: controller,
          //source code lanjutan
          tabs: <Widget>[
            new Tab(
              text: "Business",
            ),
            new Tab(
              text: "Competition",
            ),
            new Tab(
              text: "Other",
            ),
          ],
        ),
      ),
      body: new TabBarView(
        //controller untuk tab bar
        controller: controller,
        children: <Widget>[
          //kemudian panggil halaman sesuai tab yang sudah dibuat
          new business.Business(),
          new competition.Competition(),
          new other.OtherProject()
        ],
      ),
    );
  }
}
