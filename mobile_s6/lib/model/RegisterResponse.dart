import 'dart:convert';
import 'package:http/http.dart' as http;

class RegisterResponse {
  String id;
  String name;
  String job;
  String createdAt;

  RegisterResponse(
      {required this.id,
      required this.name,
      required this. job,
      required this.createdAt});

  factory RegisterResponse.createRegisterResponse(Map<String, dynamic> object) {
    return RegisterResponse(
      id: object['id'],
      name: object['name'],
      job: object['job'],
      createdAt: object['createdAt']);
  }

  static Future<RegisterResponse> connectToAPI(String name, String job) async {
    var apiUrl = Uri.parse("https://reqres.in/api/users");
    var apiResult = await http.post(apiUrl, body: {"name": name, "job": job});

    var jsonObject = json.decode(apiResult.body);

    return RegisterResponse.createRegisterResponse(jsonObject);
  }
}