import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:github_repo_search/bloc/githubsearch_bloc.dart';

class IosTextField extends StatelessWidget {
  const IosTextField({
    Key key,
    @required this.gitHubSearchBloc,
    @required this.textFieldController,
  }) : super(key: key);

  final GithubsearchBloc gitHubSearchBloc;
  final TextEditingController textFieldController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 16.0, right: 16.0, top: 85.0, bottom: 16.0),
      child: CupertinoTextField(
        showCursor: true,
        cursorColor: Colors.blue[300],
        suffix: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CupertinoButton(
              pressedOpacity: 0.8,
              disabledColor: Colors.blue[100],
              padding: EdgeInsets.symmetric(horizontal: 28.0, vertical: 14.0),
              color: Colors.blue[300],
              child: Text(
                'НАЙТИ',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w600),
              ),
              borderRadius: const BorderRadius.all(const Radius.circular(50.0)),
              onPressed: () {
                gitHubSearchBloc.add(FetchRepos(textFieldController.text));
              }),
        ),
        decoration: BoxDecoration(
            border: Border.all(
                color: Colors.grey[350], width: 0.5, style: BorderStyle.solid),
            shape: BoxShape.rectangle,
            borderRadius: const BorderRadius.all(const Radius.circular(50.0))),
        controller: textFieldController,
        maxLines: 1,
        enableSuggestions: false,
      ),
    );
  }
}
