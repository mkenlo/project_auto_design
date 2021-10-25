import 'package:flutter/material.dart';
import 'package:project_auto_design/widgets/custom_bottom_navbar.dart';

import '../data/fetch_service.dart';
import '../data/models/vehicle_model.dart';
import '../values/colors.dart';
import '../values/dimen.dart';
import 'home_screen.dart';

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
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _getPage(int index) {
    if (index != 0) return _emptyScreen();
    return Home();
  }

  Widget _emptyScreen() {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: APP_BG,
            elevation: 0.0,
            centerTitle: true,
            title: Text("Intentionally left Blank")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: Colors.white70,
          title: Text("Vehicle Type", style: TextStyle(color: APP_BG))),
      body: Container(
          color: APP_BG,
          padding: EdgeInsets.all(DEFAULT_PADDING),
          child: _loadVehicles()),
      bottomNavigationBar: CustomBottomNavBar(_selectedIndex, _onItemTapped),
    );
  }

  Widget _loadVehicles() {
    return FutureBuilder(
        future: fetchAndFilterVehicles(widget.searchQuery),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Center(
                  child: Text("Sorry, Error has occured",
                      style: TextStyle(color: Colors.white)));
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasError)
                return Text("Error in Data {$snapshot.error}",
                    style: TextStyle(color: Colors.white));
              if (!snapshot.hasData || snapshot.data.length == 0)
                return Center(
                    child: Text("Sorry, No match found",
                        style: TextStyle(color: Colors.white)));
              return _buildGrid(snapshot.data);
          }
          return null;
        });
  }

  Widget _buildGrid(List<Vehicle> items) {
    return GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildGridItem(items.elementAt(index));
        });
  }

  Widget _buildGridItem(Vehicle item) {
    return GridTile(
        child: Image.asset("assets/images/transport.png"),
        footer: Column(children: [
          Text("\$" + item.price.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold)),
          Text(item.description(), style: TextStyle(color: Colors.white))
        ]));
  }
}
