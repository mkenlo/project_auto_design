import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../values/dimen.dart';

class CustomButton extends StatelessWidget {
  String title;
  Function callback;
  CustomButton(String title, Function callback) {
    this.title = title;
    this.callback = callback;
  }

  // @TODO remove hard coded values
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(vertical: DEFAULT_PADDING / 2),
        child: TextButton(
            child: Text(this.title,
                style:
                    TextStyle(color: Theme.of(context).colorScheme.secondary)),
            onPressed: this.callback),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            border: Border.all(
                color: Theme.of(context).colorScheme.secondary, width: 2.0)));
  }
}
