import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ungque/utility/my_contstant.dart';
import 'package:ungque/utility/normal_dialog.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String name, user, password, rePassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('สมัครสมาชิก'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildName(),
              buildUser(),
              buildPassword(),
              buildRePassword(),
              buildRegister(),
            ],
          ),
        ),
      ),
    );
  }

  Container buildRegister() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: 250,
      child: RaisedButton(
        onPressed: () {
          if (name == null ||
              name.isEmpty ||
              user == null ||
              user.isEmpty ||
              password == null ||
              password.isEmpty ||
              rePassword == null ||
              rePassword.isEmpty) {
            normalDialog(context, 'Have Space ? Please Fill Every Blank');
          } else if (password != rePassword) {
            normalDialog(context, 'Password Dont Math');
          } else {
            registerThread();
          }
        },
        child: Text('Register'),
      ),
    );
  }

  Future<Null> registerThread() async {
    String url =
        '${MyConstant().domain}/ungque/addUser.php?isAdd=true&Name=$name&User=$user&Password=$password';

    await Dio().get(url).then((value) {
      if (value.toString() == 'true') {
        Navigator.pop(context);
      } else {
        normalDialog(context, 'Please Try Again => Someting Else');
      }
    });
  }

  Container buildName() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: 250,
      child: TextField(
        onChanged: (value) => name = value.trim(),
        decoration: InputDecoration(
          labelText: 'Name :',
          border: OutlineInputBorder(),
        ),
      ),
    );
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
        obscureText: true,
        onChanged: (value) => password = value.trim(),
        decoration: InputDecoration(
          labelText: 'Password :',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Container buildRePassword() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: 250,
      child: TextField(
        obscureText: true,
        onChanged: (value) => rePassword = value.trim(),
        decoration: InputDecoration(
          labelText: 'Re-Password :',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
