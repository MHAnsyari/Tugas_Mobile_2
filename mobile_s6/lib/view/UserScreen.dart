import 'package:flutter/material.dart';
import 'package:mobile_s6/model/userResponse.dart';

class UserScreen extends StatefulWidget {
  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  UserResponse? userResponse = null;
  List<UserResponse> userList = [];
  @override
  void initState() {
    print('Init State');
    UserResponse.getUserList('1').then((value) {
      userList = value;
      setState(() {});
      super.initState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Daftar User',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pink,
      ),
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          return InkWell(
            child: Card(
              child: Row(
                children: [
                  Image(
                    width: 100,
                    height: 100,
                    image: NetworkImage(userList[index].avatar),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(userList[index].name),
                        Text(userList[index].email),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}