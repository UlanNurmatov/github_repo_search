// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resultItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) {
  return Item(
    json['id'] as int,
    json['name'] as String,
    json['owner'] == null
        ? null
        : Owner.fromJson(json['owner'] as Map<String, dynamic>),
    json['description'] as String,
    json['stargazers_count'] as int,
    json['updated_at'] as String,
    json['open_issues_count'] as int,
  );
}

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'owner': instance.owner?.toJson(),
      'description': instance.description,
      'stargazers_count': instance.stargazers_count,
      'updated_at': instance.updated_at,
      'open_issues_count': instance.open_issues_count,
    };
