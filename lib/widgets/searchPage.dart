import 'package:flutter/material.dart';
import 'package:github_repo_search/helper/resultScreenArguments.dart';
import 'package:github_repo_search/screens/results.dart';
import 'package:github_repo_search/widgets/androidTextField.dart';
import 'package:github_repo_search/widgets/iosTextField.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repo_search/bloc/githubsearch_bloc.dart';

class InitialSearch extends StatelessWidget {
  const InitialSearch({
    Key key,
    @required this.textFieldController,
  }) : super(key: key);

  final TextEditingController textFieldController;
  @override
  Widget build(BuildContext context) {
    //ignore: close_sinks
    final gitHubSearchBloc = BlocProvider.of<GithubsearchBloc>(context);

    return Container(
        margin: EdgeInsets.only(top: 30.0),
        child: Column(children: [
          Form(
            child: Platform.isAndroid
                ? AndroidTextField(
                    textFieldController: textFieldController,
                    gitHubSearchBloc: gitHubSearchBloc)
                : IosTextField(
                    gitHubSearchBloc: gitHubSearchBloc,
                    textFieldController: textFieldController),
          ),
          BlocListener<GithubsearchBloc, GithubsearchState>(
            listener: (context, GithubsearchState state) {
              if (state is GitHubSearchLoaded) {
                Navigator.pushNamed(context, ResultsScreen.routeName,
                    arguments: ResultScreenArguments(
                        state.results, textFieldController.text));
              }
            },
            child: BlocBuilder<GithubsearchBloc, GithubsearchState>(
                builder: (context, state) {
              if (state is GitHubSearchInitial) {
                return Container();
              } else if (state is GitHubSearchLoading) {
                return Platform.isAndroid
                    ? CircularProgressIndicator()
                    : CupertinoActivityIndicator();
              } else if (state is GitHubSearchEmptyResult) {
                return Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text('Не удалось найти ни одного репозитория'),
                );
              } else if (state is GitHubSearchLoaded) {
                return Container();
              } else {
                return Text('Ошибка. Попробуйте еще раз');
              }
            }),
          )
        ]));
  }
}
