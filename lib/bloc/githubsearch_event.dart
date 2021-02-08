part of 'githubsearch_bloc.dart';

abstract class GithubsearchEvent extends Equatable {
  const GithubsearchEvent();

  @override
  List<Object> get props => [];
}

class FetchRepos extends GithubsearchEvent {
  final String query;
  FetchRepos(this.query);

  @override
  List<Object> get props => [query];
}
