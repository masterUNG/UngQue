import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ungque/utility/my_contstant.dart';

class Clinic extends StatefulWidget {
  @override
  _ClinicState createState() => _ClinicState();
}

class _ClinicState extends State<Clinic> {
  List<String> titles = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readClinic();
  }

  Future<Null> readClinic() async {
    String path = '${MyConstant().domain}/ungque/getClinicCat.php';
    await Dio().get(path).then((value) {
      print('value = $value');
      var result = json.decode(value.data);
      for (var map in result) {
        setState(() {
          titles.add(map['Title']);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: titles.length == 0
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: titles.length,
              itemBuilder: (context, index) => Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(titles[index]),
                ),
              ),
            ),
    );
  }
}
