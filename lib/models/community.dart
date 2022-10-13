import 'package:json_annotation/json_annotation.dart';

part 'community.g.dart';

@JsonSerializable()
class SimplePost {
  final int id;
  final String? backdrop_image;
  final String title;
  final bool is_scrap;

  SimplePost({
    required this.id,
    this.backdrop_image,
    required this.title,
    required this.is_scrap,
  });

  factory SimplePost.fromJson(Map<String, dynamic> json) =>
      _$SimplePostFromJson(json);

  Map<String, dynamic> toJson() => _$SimplePostToJson(this);
}
