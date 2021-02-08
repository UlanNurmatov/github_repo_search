import 'package:flutter/material.dart';

class AndroidAppBar extends StatelessWidget {
  const AndroidAppBar({
    Key key,
    @required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Colors.white,
      title: Text(
        title.toUpperCase(),
        style: TextStyle(fontSize: 18.0, color: Colors.black),
      ),
    );
  }
}
