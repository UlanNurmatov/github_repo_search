import 'package:github_repo_search/models/owner.dart';
import 'package:json_annotation/json_annotation.dart';
part 'resultItem.g.dart';

@JsonSerializable(explicitToJson: true)
class Item {
  int id;
  String name;
  Owner owner;
  String description;
  int stargazers_count;
  String updated_at;
  int open_issues_count;

  Item(this.id, this.name, this.owner, this.description, this.stargazers_count,
      this.updated_at, this.open_issues_count);

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
