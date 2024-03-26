import 'dart:convert';
import 'package:http/http.dart' as http;

class UserResponse {
  String id;
  String email;
  String name;
  String avatar;

  UserResponse(
      {required this.id,
      required this.email,
      required this.name,
      required this.avatar});

  factory UserResponse.createUserResponse(Map<String, dynamic> object) {
    return UserResponse(
        id: object['id']. tostring(),
        email: object['email'],
        name: object['first_name'] + " " + object['last_name'],
        avatar: object['avatar']);
  }

  static Future<List<UserResponse>> getUserList(String page) async {
    var apiurl = Uri.parse("https://regres.in/api/users?page=" + page);
    var apiResult = await http.get(apiurl);

    var jsonobject = json.decode(apiResult.body);
    List<dynamic> listUser = (jsonobject as Map<String, dynamic> )['data'];

    List<UserResponse> users = [];
    for (int i = 0; i < listUser.length; i++) {
    users.add(UserResponse.createUserResponse(listUser[i]));
    }
    return users;
  }
}