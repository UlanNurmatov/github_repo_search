import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:github_repo_search/screens/home.dart';
import 'package:github_repo_search/screens/results.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final mainColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoApp(
            debugShowCheckedModeBanner: false,
            theme: CupertinoThemeData(
              textTheme: CupertinoTextThemeData(
                  navTitleTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                  navActionTextStyle: TextStyle(color: Colors.black)),
              primaryColor: Colors.white,
              barBackgroundColor: Colors.white,
            ),
            home: Home(),
            routes: {
              '/home': (context) => Home(),
              ResultsScreen.routeName: (context) => ResultsScreen()
            },
          )
        : MaterialApp(
            initialRoute: '/home',
            routes: {
              '/home': (context) => Home(),
              ResultsScreen.routeName: (context) => ResultsScreen()
            },
          );
  }
}
