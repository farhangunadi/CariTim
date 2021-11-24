import 'package:http/http.dart' as http;
import 'dart:convert';

Future loginUser(String email, String password) async {
  String url = 'http://api-caritim.herokuapp.com/users/login';
  final response = await http.post(Uri.parse(url),
      headers: {"Accept": "Application/json"},
      body: {'email': email, 'password': password});
  var convertedDatatoJson = jsonDecode(response.body);
  return convertedDatatoJson;
}
