// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecentSearch _$RecentSearchFromJson(Map<String, dynamic> json) => RecentSearch(
      id: json['id'] as int,
      created: DateTime.parse(json['created'] as String),
      search_word: json['search_word'] as String,
    );

Map<String, dynamic> _$RecentSearchToJson(RecentSearch instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created': instance.created.toIso8601String(),
      'search_word': instance.search_word,
    };

SearchRank _$SearchRankFromJson(Map<String, dynamic> json) => SearchRank(
      count: json['count'] as int,
      search_word: json['search_word'] as String,
    );

Map<String, dynamic> _$SearchRankToJson(SearchRank instance) =>
    <String, dynamic>{
      'count': instance.count,
      'search_word': instance.search_word,
    };
