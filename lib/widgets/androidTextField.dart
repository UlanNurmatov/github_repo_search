import 'package:flutter/material.dart';
import 'package:github_repo_search/bloc/githubsearch_bloc.dart';

class AndroidTextField extends StatelessWidget {
  const AndroidTextField({
    Key key,
    @required this.textFieldController,
    @required this.gitHubSearchBloc,
  }) : super(key: key);

  final TextEditingController textFieldController;
  final GithubsearchBloc gitHubSearchBloc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 16.0, right: 16.0, top: 85.0, bottom: 16.0),
      child: TextFormField(
          controller: textFieldController,
          autocorrect: false,
          maxLines: 1,
          obscureText: false,
          enableSuggestions: false,
          decoration: InputDecoration(
              suffixIcon: GestureDetector(
                onTap: () {
                  gitHubSearchBloc.add(FetchRepos(textFieldController.text));
                },
                child: Icon(
                  Icons.search,
                  color: Colors.blue[300],
                ),
              ),
              border: OutlineInputBorder(
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(50.0))),
              labelStyle: TextStyle(color: Colors.black))),
    );
  }
}
