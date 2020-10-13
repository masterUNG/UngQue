import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ungque/widget/authen.dart';
import 'package:ungque/widget/clinic.dart';
import 'package:ungque/widget/news.dart';
import 'package:ungque/widget/scan_qr_code.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  List<Widget> widgets = [Clinic(), ScanQrCode(), News()];
  int index = 0;

  List<BottomNavigationBarItem> lists() {
    return [
      BottomNavigationBarItem(icon: Icon(Icons.accessible), label: 'Clinic'),
      BottomNavigationBarItem(icon: Icon(Icons.addchart), label: 'Scan QR'),
      BottomNavigationBarItem(icon: Icon(Icons.filter_sharp), label: 'News'),
    ].toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () async {
              SharedPreferences preferences =
                  await SharedPreferences.getInstance();
              preferences.clear();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Authen(),
                  ),
                  (route) => false);
            },
          )
        ],
      ),
      body: widgets[index],
      bottomNavigationBar: BottomNavigationBar(
        items: lists(),
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
      ),
    );
  }
}
