import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repo_search/bloc/githubsearch_bloc.dart';
import 'package:github_repo_search/bloc/githubsearch_repo.dart';
import 'package:github_repo_search/widgets/searchPage.dart';
import 'package:github_repo_search/widgets/androidAppBar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final textFieldController = TextEditingController();
  bool isButtonDisabled = false;

  @override
  Widget build(BuildContext context) {
    final String title = 'Поиск';
    final PreferredSizeWidget appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text(title.toUpperCase()),
          )
        : AndroidAppBar(title: title);

    final pageBody = BlocProvider(
        create: (context) {
          return GithubsearchBloc(ResultsRepo());
        },
        child: InitialSearch(textFieldController: textFieldController));

    return Platform.isIOS
        ? GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: CupertinoPageScaffold(
              navigationBar: appBar,
              child: pageBody,
            ),
          )
        : GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: Scaffold(appBar: appBar, body: pageBody));
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textFieldController.dispose();
    super.dispose();
  }
}
