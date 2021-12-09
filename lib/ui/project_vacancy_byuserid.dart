import 'package:cari_tim_flutter/util/c_color.dart';
import 'package:flutter/material.dart';
import 'package:cari_tim_flutter/model/DataModel.dart';
import 'package:cari_tim_flutter/model/api_service.dart';



class ProjectVacancyByUserID extends StatefulWidget {
  const ProjectVacancyByUserID({Key? key}) : super(key: key);

  @override
  _ProjectVacancyByUserIDState createState() => _ProjectVacancyByUserIDState();
}

class _ProjectVacancyByUserIDState extends State<ProjectVacancyByUserID> {
  late Future<List<Vacancy>> futureVacancyByID;

  @override
  void initState() {
    super.initState();
    futureVacancyByID = fetchVacancyByUserID();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Get All Vacancy By user_id',
      theme: ThemeData(
        primaryColor: Colors.lightBlueAccent,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Get All Vacancy By user_id'),
        ),
        body: FutureBuilder<List<Vacancy>>(
          future: futureVacancyByID,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Container(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Color(0xff97FFFF),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${snapshot.data![index].title}",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text("${snapshot.data![index].position}"),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
