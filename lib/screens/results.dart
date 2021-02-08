import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:github_repo_search/helper/resultScreenArguments.dart';
import 'package:github_repo_search/widgets/ResultsScrollView.dart';
import 'package:github_repo_search/widgets/androidAppBar.dart';

class ResultsScreen extends StatelessWidget {
  static const routeName = '/resultsScreen';

  @override
  Widget build(BuildContext context) {
    final ResultScreenArguments args =
        ModalRoute.of(context).settings.arguments;
    final String title = 'Результат поиска';

    final PreferredSizeWidget appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text(title.toUpperCase()),
          )
        : AndroidAppBar(title: title);

    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: appBar,
            child: ResultsScrollView(args.result, args.query),
          )
        : Scaffold(
            appBar: appBar, body: ResultsScrollView(args.result, args.query));
  }
}
