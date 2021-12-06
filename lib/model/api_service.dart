import 'package:cari_tim_flutter/model/DataModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

String url = 'http://api-caritim.herokuapp.com';

Future loginUser(String email, String password) async {
  final response = await http.post(Uri.parse(url + '/users/login'),
      headers: {"Accept": "Application/json"},
      body: {'email': email, 'password': password});
  var convertedDatatoJson = jsonDecode(response.body);
  return convertedDatatoJson;
}

Future registerData(
    String fname, String sname, String email, String password) async {
  final response = await http.post(Uri.parse(url + '/users'), headers: {
    "Accept": "Application/json"
  }, body: {
    'first_name': fname,
    'surname': sname,
    'email': email,
    'password': password
  });
  var convertedDatatoJson = jsonDecode(response.body);
  return convertedDatatoJson;
}

Future verifyOTP(String code) async {
  final response = await http.post(Uri.parse(url + '/users/verify'), headers: {
    "Accept": "Application/json"
  }, body: {
    'code': code,
  });
  var convertedDatatoJson = jsonDecode(response.body);
  return convertedDatatoJson;
}

Future createVacancy(
    String title,
    String description,
    String type,
    String start_date,
    String end_date,
    String user_id,
    String position,
    String job_description,
    String amount,
    String token) async {
  final response = await http.post(Uri.parse(url + '/vacancys'), headers: {
    "Accept": "Application/json",
    "Authorization": "Bearer " + token
  }, body: {
    'title': title, 
    'description': description,
    'type': type,
    'start_date': start_date,
    'end_date': end_date,
    'user_id': user_id,
    'position': position,
    'job_description': job_description,
    'amount': amount
  });
  var convertedDatatoJson = jsonDecode(response.body);
  return convertedDatatoJson;
}
