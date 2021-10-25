import 'package:flutter/material.dart';

import '../values/colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final void Function(int) onItemTapped;

  CustomBottomNavBar(this.selectedIndex, this.onItemTapped);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Theme.of(context).colorScheme.secondary,
      currentIndex: this.selectedIndex,
      onTap: this.onItemTapped,
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
  }
}
