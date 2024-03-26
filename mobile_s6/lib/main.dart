import 'package:flutter/material.dart';
import 'package:mobile_s6/view/Screen_Page_Register.dart';
import 'package:mobile_s6/view/UserScreen.dart';


void main () {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserScreen(), //UserResponse
    );
  }
}