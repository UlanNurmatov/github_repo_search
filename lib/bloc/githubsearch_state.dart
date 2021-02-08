part of 'githubsearch_bloc.dart';

abstract class GithubsearchState extends Equatable {
  const GithubsearchState();

  @override
  List<Object> get props => [];
}

class GitHubSearchInitial extends GithubsearchState {}

class GitHubSearchLoading extends GithubsearchState {}

class GitHubSearchLoaded extends GithubsearchState {
  final Results results;
  GitHubSearchLoaded(this.results);

  @override
  List<Object> get props => [results];
}

class GitHubSearchNotLoaded extends GithubsearchState {}

class GitHubSearchEmptyResult extends GithubsearchState {}
