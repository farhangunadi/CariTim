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
