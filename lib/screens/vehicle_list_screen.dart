import 'package:flutter/material.dart';

import '../values/colors.dart';

class VehicleListScreen extends StatefulWidget {
  VehicleListScreen({Key key}) : super(key: key);

  @override
  _VehicleListScreenState createState() => _VehicleListScreenState();
}

class _VehicleListScreenState extends State<VehicleListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0.0,
            centerTitle: true,
            backgroundColor: Colors.white70,
            title: Text("Vehicle Type", style: TextStyle(color: APP_BG))),
        body: Text("vehicle"));
  }
}
