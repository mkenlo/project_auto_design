import 'package:flutter/material.dart';

import '../values/colors.dart';

class VehicleListScreen extends StatefulWidget {
  String searchQuery;

  VehicleListScreen(String searchQuery, {Key key}) {
    //super(key: key);
    this.searchQuery = searchQuery;
  }

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
        body: Container(color: APP_BG, child: _buildGrid()));
  }

  Widget _buildGrid() {
    return GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return _buildGridItem(index);
        });
  }

  Widget _buildGridItem(int index) {
    return Container(
        child: Column(children: [
      Image.asset("assets/images/transport.png", width: 150.0),
      Text("Make $index", style: TextStyle(color: Colors.white))
    ]));
  }
}
