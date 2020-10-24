import 'package:flutter/material.dart';

class TestSliverAppBar extends StatefulWidget {
  @override
  _TestSliverAppBarState createState() => _TestSliverAppBarState();
}

class _TestSliverAppBarState extends State<TestSliverAppBar> {
  List<Widget> myslivers() {
    return [
      SliverAppBar(
        leading: Icon(Icons.android),
        expandedHeight: 220,
        floating: true,
        pinned: true,
        snap: true,
        elevation: 50,
        flexibleSpace: FlexibleSpaceBar(
          title: Text('Flexible'),
          centerTitle: true,
          background: Image.asset('images/logo.png'),
        ),
      ),
      SliverList(
        delegate: SliverChildListDelegate(
          buildList(),
        ),
      )
    ].toList();
  }

  List<Widget> buildList() {
    List<Widget> listItems = List();
    for (var i = 0; i < 50; i++) {
      listItems.add(Text('Text Item $i'));
    }
    return listItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: myslivers(),
      ),
    );
  }
}
