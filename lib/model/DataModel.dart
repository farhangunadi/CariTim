// To parse this JSON data, do
//
//     final dataModel = dataModelFromJson(jsonString);

import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
  DataModel({
    this.firstName = "",
    this.surname = "",
    this.email = "",
    this.password = "",
    this.code = "",
  });

  String firstName;
  String surname;
  String email;
  String password;
  String code;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        firstName: json["first_name"],
        surname: json["surname"],
        email: json["email"],
        password: json["password"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "surname": surname,
        "email": email,
        "password": password,
        "code": code,
      };
}

List<Vacancy> vacancyFromJson(String str) =>
    List<Vacancy>.from(json.decode(str).map((x) => Vacancy.fromMap(x)));

class Vacancy {
  Vacancy({
    required this.title,
    required this.description,
    required this.type,
    required this.start_date,
    required this.end_date,
    required this.user_id,
    required this.position,
    required this.job_description,
    required this.amount,
  });

  String title;
  String description;
  String type;
  String start_date;
  String end_date;
  String user_id;
  String position;
  String job_description;
  int amount;

  // Album({
  //   required this.userId,
  //   required this.id,
  //   required this.title,
  // });

  factory Vacancy.fromMap(Map<String, dynamic> json) => Vacancy(
      title: json["title"],
      description: json["description"],
      type: json["type"],
      start_date: json["start_date"],
      end_date: json["end_date"],
      user_id: json["user_id"],
      position: json["position"],
      job_description: json["job_description"],
      amount: json["amount"],
  );

}

List<Applicant> applicantFromJson(String str) =>
    List<Applicant>.from(json.decode(str).map((x) => Applicant.fromMap(x)));

class Applicant {
  Applicant({
    required this.vacancy_id,
    required this.message,
    required this.status,
    required this.amount,

  });

  String vacancy_id;
  String message;
  String status;
  String amount;



  factory Applicant.fromMap(Map<String, dynamic> json) => Applicant(
    vacancy_id: json["vacancy_id"],
    message: json["message"],
    status: json["status"],
    amount: json["amount"],

  );

}
