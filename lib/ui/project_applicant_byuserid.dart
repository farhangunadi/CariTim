import 'package:cari_tim_flutter/util/c_color.dart';
import 'package:flutter/material.dart';
import 'package:cari_tim_flutter/model/DataModel.dart';
import 'package:cari_tim_flutter/model/api_service.dart';



class ProjectApplicantByUserID extends StatefulWidget {
  const ProjectApplicantByUserID({Key? key}) : super(key: key);

  @override
  _ProjectApplicantByUserIDState createState() => _ProjectApplicantByUserIDState();
}

class _ProjectApplicantByUserIDState extends State<ProjectApplicantByUserID> {
  late Future<List<Applicant>> futureApplicantByID;

  @override
  void initState() {
    super.initState();
    futureApplicantByID = fetchApplicantByUserID();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Get All Applicant By user_id',
      theme: ThemeData(
        primaryColor: Colors.lightBlueAccent,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Get All Applicant By user_id'),
        ),
        body: FutureBuilder<List<Applicant>>(
          future: futureApplicantByID,
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
                          "${snapshot.data![index].vacancy_id}",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text("${snapshot.data![index].status}"),
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
