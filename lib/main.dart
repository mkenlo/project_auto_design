import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'values/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Auto App',
      theme: ThemeData(primarySwatch: APP_THEME),
      home: HomeScreen(),
    );
  }
}
