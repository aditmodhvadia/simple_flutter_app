import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  Color backgroundColor;

  CustomAppBar({Key key, @required this.title, this.backgroundColor})
      : preferredSize = Size.fromHeight(56.0),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: backgroundColor == null
          ? Theme.of(context).primaryColor
          : backgroundColor,
    );
  }
}
