import 'package:cari_tim_flutter/util/c_color.dart';
import 'package:flutter/material.dart';
import 'package:cari_tim_flutter/model/DataModel.dart';
import 'package:cari_tim_flutter/model/api_service.dart';

class ProjectDiscovery extends StatefulWidget {
  const ProjectDiscovery({Key? key}) : super(key: key);

  @override
  _ProjectDiscoveryState createState() => _ProjectDiscoveryState();
}

class _ProjectDiscoveryState extends State<ProjectDiscovery> {
  late Future<List<Vacancy>> futureVacancy;

  @override
  void initState() {
    super.initState();
    futureVacancy = fetchVacancys();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CColor.orangeColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: CColor.whiteColor,
          ),
        ),
        elevation: 0,
        title: Text("Project Discovery"),
      ),
      body:
      ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 20, top: 30),
            child: Row(
              children: [
                Text(
                  "Businness Project",
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
                child: FutureBuilder<List<Vacancy>>(
                  future: futureVacancy,
                  builder: (BuildContext context,AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          padding: EdgeInsets.all(20),
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) =>Container(
                            child: Container(
                                color: CColor.orangeColor,
                                margin: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                    // OutlineInputBorder(
                                    //   borderSide:
                                    //     // borderRadius: BorderRadius.circular(20),
                                    //     // borderSide: BorderSide(color: Colors.white),
                                    // )
                                ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(
                                    title: Text(
                                      snapshot.data[index]['title'],
                                      style: TextStyle(
                                          color: CColor.whiteColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    subtitle: Text(
                                        snapshot.data[index]['type'],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text("Position : " +  snapshot.data[index]['position'],
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
                                            splashColor: Colors.redAccent,
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
                            ),
                          ),
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                ),
                // child: Card(
                //
                //   elevation: 5,
                //   shadowColor: CColor.greyColor,
                //   color: CColor.orangeColor,
                //   margin: EdgeInsets.all(20),
                //   shape: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(20),
                //       borderSide: BorderSide(color: Colors.white)),
                // ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
