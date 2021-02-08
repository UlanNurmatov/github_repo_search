import 'package:json_annotation/json_annotation.dart';
import 'package:github_repo_search/models/resultItem.dart';
part 'results.g.dart';

@JsonSerializable(explicitToJson: true)
class Results {
  int total_count;
  bool incomplete_results;
  List<Item> items;
  int forks;
  int open_issues;
  int watchers;
  String default_branch;
  double score;

  Results(this.total_count, this.incomplete_results, this.items, this.forks,
      this.open_issues, this.watchers, this.default_branch, this.score);

  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);

  Map<String, dynamic> toJson() => _$ResultsToJson(this);
}
