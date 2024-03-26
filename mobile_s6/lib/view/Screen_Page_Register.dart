import 'package:flutter/material.dart';
import 'package:mobile_s6/model/RegisterResponse.dart';

class ScreenPageRegister extends StatefulWidget {
  @override
  State<ScreenPageRegister> createState() => _ScreenPageRegisterState();
}

class _ScreenPageRegisterState extends State<ScreenPageRegister> {
  RegisterResponse? registerResponse = null;
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register Screen',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pink,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      hintText: 'Masukkan Nama Anda',
                      labelText: 'Nama',
                      border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: jobController,
                  decoration: InputDecoration(
                      hintText: 'Masukkan Pekerjaan Anda',
                      labelText: 'Pekerjaan',
                      border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                    ),
                    onPressed: () {
                      RegisterResponse.connectToAPI(
                              nameController.text, jobController.text)
                          .then((value) {
                        registerResponse = value;
                        setState(() {});
                      });
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(registerResponse == null
                    ? 'Tidak Ada Data'
                    : registerResponse!.id +
                        ' | ' +
                        registerResponse!.name +
                        ' | ' +
                        registerResponse!.job +
                        ' | ' +
                        registerResponse!.createdAt),
              ],
            ),
          )
        ],
      ),
    );
  }
}