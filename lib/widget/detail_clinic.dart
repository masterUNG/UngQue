import 'package:flutter/material.dart';
import 'package:ungque/models/clinic_model.dart';

class DetailClinic extends StatefulWidget {
  final ClinicModel model;
  DetailClinic({Key key, this.model}) : super(key: key);
  @override
  _DetailClinicState createState() => _DetailClinicState();
}

class _DetailClinicState extends State<DetailClinic> {
  ClinicModel model;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    model = widget.model;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(model.name),
      ),
      body: Column(
        children: [
          buildText(),
          buildPadding(),
        ],
      ),
    );
  }

  Padding buildPadding() {
    return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(model.address),
        );
  }

  Row buildText() {
    return Row(
      children: [
        Text(
          'Address',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
