import 'package:json_annotation/json_annotation.dart';

part 'search.g.dart';

@JsonSerializable()
class RecentSearch {
  final int id;
  final DateTime created;
  final String search_word;

  RecentSearch({
    required this.id,
    required this.created,
    required this.search_word,
  });

  factory RecentSearch.fromJson(Map<String, dynamic> json) =>
      _$RecentSearchFromJson(json);

  Map<String, dynamic> toJson() => _$RecentSearchToJson(this);
}

@JsonSerializable()
class SearchRank {
  final int count;
  final String search_word;

  const SearchRank({
    required this.count,
    required this.search_word,
  });

  factory SearchRank.fromJson(Map<String, dynamic> json) =>
      _$SearchRankFromJson(json);

  Map<String, dynamic> toJson() => _$SearchRankToJson(this);
}
