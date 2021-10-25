import 'package:flutter/material.dart';
import 'package:project_auto_design/screens/vehicle_list_screen.dart';
import 'package:project_auto_design/widgets/custom_bottom_navbar.dart';

import '../values/colors.dart';
import '../values/dimen.dart';
import '../values/strings.dart';
import '../widgets/custom_button.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    final bottom = CustomBottomNavBar(_selectedIndex, _onItemTapped);
    return Scaffold(
        body: _getPage(_selectedIndex), bottomNavigationBar: bottom);
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget logo = Padding(
      padding: EdgeInsets.only(top: 50.0),
      child: Image.asset("assets/images/logo.png"),
    );
    Widget searchBtn = Padding(
        padding: EdgeInsets.symmetric(vertical: DEFAULT_PADDING * 2),
        child: TextField(
            controller: _controller,
            decoration: InputDecoration(
                filled: true,
                fillColor: APP_THEME.shade50,
                contentPadding: EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                hintText: BTN_SEARCH_HINT)));
    return Material(
        child: Container(
            padding: EdgeInsets.all(DEFAULT_PADDING),
            color: APP_BG,
            child: Center(
                child: Column(children: [
              logo,
              searchBtn,
              CustomButton(BTN_SEARCH_BY_TYPE, () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            VehicleListScreen(_controller.text)));
              }),
              CustomButton(BTN_SEARCH_DEALS, () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(content: Text(_controller.text));
                  },
                );
              })
            ]))));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
