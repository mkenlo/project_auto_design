import 'package:flutter/material.dart';

import '../values/dimen.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final void Function() callback;

  CustomButton(this.title, this.callback);

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
