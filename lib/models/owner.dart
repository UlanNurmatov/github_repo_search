import 'package:json_annotation/json_annotation.dart';
part 'owner.g.dart';

@JsonSerializable()
class Owner {
  String login;
  String avatar_url;

  Owner(this.login, this.avatar_url);

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);

  Map<String, dynamic> toJson() => _$OwnerToJson(this);
}
