import 'package:flutter/material.dart';
import 'package:ungque/widget/authen.dart';
import 'package:ungque/widget/test_sliver_appbar.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TestSliverAppBar(),
    );
  }
}
