import 'package:cari_tim_flutter/model/DataModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String url = 'http://api-caritim.herokuapp.com';
Future loginUser(String email, String password) async {
  final response = await http.post(Uri.parse(url + '/users/login'),
      headers: {"Accept": "Application/json"},
      body: {'email': email, 'password': password});
  var convertedDatatoJson = jsonDecode(response.body);
  return convertedDatatoJson;
}

Future<DataModel?> registerData(
    String fname, String sname, String email, String password) async {
  final response = await http.post(Uri.parse(url + '/users'), headers: {
    "Accept": "Application/json"
  }, body: {
    'first_name': fname,
    'surname': sname,
    'email': email,
    'password': password
  });
  var data = response.body;
  print(data);

  if (response.statusCode == 200) {
    String responseString = response.body;
    dataModelFromJson(responseString);
  } else
    return null;
}
