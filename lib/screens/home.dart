import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("HomePage")),
        body: Column(children: [
          Text("Logo"),
          TextField(
              decoration: InputDecoration(labelText: 'Search Make and Model')),
          TextButton(onPressed: () {}, child: Text("Search by Vehicle type")),
          TextButton(onPressed: () {}, child: Text("See Deals of the day"))
        ]));
  }
}
