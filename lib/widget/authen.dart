import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ungque/utility/my_contstant.dart';
import 'package:ungque/utility/normal_dialog.dart';
import 'package:ungque/widget/my_service.dart';
import 'package:ungque/widget/register.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  String user, password;

  @override
  void initState() {
    super.initState();
    checkStatusLogin();
  }

  Future<Null> checkStatusLogin() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      if (preferences.getString('User') != null) {
        routeToService();
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.limeAccent[400]),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(color: Colors.white54),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildContainer(),
                  buildText(),
                  buildUser(),
                  buildPassword(),
                  buildLogin(),
                  buildFlatButton()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  FlatButton buildFlatButton() => FlatButton(
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Register(),
            )),
        child: Text('New Register'),
      );

  Container buildLogin() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: 250,
      child: RaisedButton(
        onPressed: () {
          if (user == null ||
              user.isEmpty ||
              password == null ||
              password.isEmpty) {
            normalDialog(context, 'มีช่องว่าง ? กรุณากรอกทุกช่อง คะ');
          } else {
            checkAuthen();
          }
        },
        child: Text('Login'),
      ),
    );
  }

  Future<Null> checkAuthen() async {
    String url =
        '${MyConstant().domain}/ungque/getUserWhereUser.php?isAdd=true&User=$user';

    await Dio().get(url).then((value) {
      if (value.toString() == 'null') {
        normalDialog(context, 'ไม่มี $user นี้ ในฐานข้อมูลของเรา');
      } else {
        var result = json.decode(value.data);
        for (var map in result) {
          if (password == map['Password']) {
            saveUser();
          } else {
            normalDialog(context, 'Password False');
          }
        }
      }
    });
  }

  void routeToService() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => MyService(),
        ),
        (route) => false);
  }

  Container buildUser() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: 250,
      child: TextField(
        onChanged: (value) => user = value.trim(),
        decoration: InputDecoration(
          labelText: 'User :',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Container buildPassword() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: 250,
      child: TextField(
        onChanged: (value) => password = value.trim(),
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Password :',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Text buildText() => Text(
        'Ung Que',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.pink[600],
        ),
      );

  Container buildContainer() {
    return Container(
      width: 120,
      child: Image.asset('images/logo.png'),
    );
  }

  Future<Null> saveUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('User', user);
    routeToService();
  }
}
