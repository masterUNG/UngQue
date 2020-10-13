import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ungque/models/clinic_model.dart';
import 'package:ungque/utility/my_contstant.dart';
import 'package:ungque/widget/detail_clinic.dart';

class ListClinic extends StatefulWidget {
  final String id, name;
  ListClinic({Key key, this.id, this.name}) : super(key: key);
  @override
  _ListClinicState createState() => _ListClinicState();
}

class _ListClinicState extends State<ListClinic> {
  String idCatigory, name;
  List<ClinicModel> models = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    idCatigory = widget.id;
    name = widget.name;
    readClinic();
  }

  Future<Null> readClinic() async {
    String path =
        '${MyConstant().domain}/ungque/getClinicWhereId.php?isAdd=true&idCatigory=$idCatigory';
    // print('path #################==>> $path');
    await Dio().get(path).then((value) {
      // print('value ===>> $value');
      for (var json in json.decode(value.data)) {
        ClinicModel model = ClinicModel.fromJson(json);
        // print('Address ===========>>>>>> ${model.address}');
        setState(() {
          models.add(model);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: models.length == 0
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: models.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailClinic(model: models[index],),
                    )),
                child: Card(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(color: Colors.lime),
                        child: Row(
                          children: [
                            Text(
                              models[index].name,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(models[index].address),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
