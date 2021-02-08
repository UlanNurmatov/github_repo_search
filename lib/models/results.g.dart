// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'results.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Results _$ResultsFromJson(Map<String, dynamic> json) {
  return Results(
    json['total_count'] as int,
    json['incomplete_results'] as bool,
    (json['items'] as List)
        ?.map(
            (e) => e == null ? null : Item.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['forks'] as int,
    json['open_issues'] as int,
    json['watchers'] as int,
    json['default_branch'] as String,
    (json['score'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$ResultsToJson(Results instance) => <String, dynamic>{
      'total_count': instance.total_count,
      'incomplete_results': instance.incomplete_results,
      'items': instance.items?.map((e) => e?.toJson())?.toList(),
      'forks': instance.forks,
      'open_issues': instance.open_issues,
      'watchers': instance.watchers,
      'default_branch': instance.default_branch,
      'score': instance.score,
    };
