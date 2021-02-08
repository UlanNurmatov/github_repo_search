import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:github_repo_search/bloc/githubsearch_repo.dart';
import 'package:github_repo_search/models/results.dart';

part 'githubsearch_event.dart';
part 'githubsearch_state.dart';

class GithubsearchBloc extends Bloc<GithubsearchEvent, GithubsearchState> {
  GithubsearchBloc(this.repo) : super(GitHubSearchInitial());

  ResultsRepo repo;

  @override
  Stream<GithubsearchState> mapEventToState(
    GithubsearchEvent event,
  ) async* {
    if (event is FetchRepos) {
      yield GitHubSearchLoading();
      try {
        Results results = await repo.getResults(event.query);
        if (results.items.isNotEmpty) {
          yield GitHubSearchLoaded(results);
        } else {
          yield GitHubSearchEmptyResult();
        }
      } catch (_) {
        yield GitHubSearchNotLoaded();
      }
    }
  }
}
