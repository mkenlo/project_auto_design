import 'package:flutter/material.dart';

import '../values/colors.dart';
import '../values/dimen.dart';
import '../widgets/CustomButton.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

//@TODO remove all hard coded dimensions and string values
class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget getPage(int index) {
    if (index != 0) {
      return Scaffold(
          appBar: AppBar(
              elevation: 0.0,
              centerTitle: true,
              title: Text("Intentionally left Blank")));
    }
    return Home();
  }

  @override
  Widget build(BuildContext context) {
    final bottom = BottomNavigationBar(
      selectedItemColor: Theme.of(context).colorScheme.secondary,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.home, color: APP_BG), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.mode_comment_outlined, color: APP_BG),
            label: 'Messages'),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border, color: APP_BG),
            label: 'Favorite'),
        BottomNavigationBarItem(
            icon: Icon(Icons.upload_file, color: APP_BG), label: 'Files'),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: APP_BG), label: "Settings"),
      ],
    );

    return Scaffold(body: getPage(_selectedIndex), bottomNavigationBar: bottom);
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // @TODO replace this placeholder logo with an actual dummy image
    Widget logo = SizedBox(
        width: 400.0,
        height: 150.0,
        child: Center(
            child: Text("LOGO",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 32.0))));
    Widget searchBtn = TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xFFF9F7F5),
            contentPadding: EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
            hintText: 'SEARCH MAKE AND MODEL'));

    return Material(
        child: Container(
            padding: EdgeInsets.all(DEFAULT_PADDING),
            color: APP_BG,
            child: Center(
                child: Column(children: [
              logo,
              searchBtn,
              CustomButton("SEARCH BY VEHICLE TYPE", searchVehicleByType("")),
              CustomButton("SEE DEALS OF THE DAY", () {})
            ]))));
  }

  searchVehicleByType(String searchQuery) {
    //@TODO
  }
}
