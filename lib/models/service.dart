import 'package:json_annotation/json_annotation.dart';

part 'service.g.dart';

@JsonSerializable()
class Notice {
  final int id;
  final DateTime created;
  final String title, description;

  Notice({
    required this.id,
    required this.created,
    required this.title,
    required this.description,
  });

  factory Notice.fromJson(Map<String, dynamic> json) => _$NoticeFromJson(json);

  Map<String, dynamic> toJson() => _$NoticeToJson(this);
}

@JsonSerializable()
class Inquiry {
  final int id;
  final DateTime created;
  final String title, description;
  final bool is_answer;

  Inquiry({
    required this.id,
    required this.created,
    required this.title,
    required this.description,
    required this.is_answer,
  });

  factory Inquiry.fromJson(Map<String, dynamic> json) =>
      _$InquiryFromJson(json);

  Map<String, dynamic> toJson() => _$InquiryToJson(this);
}

@JsonSerializable()
class MainInfo {
  final int id;
  final String title, description;

  MainInfo({
    required this.id,
    required this.title,
    required this.description,
  });

  factory MainInfo.fromJson(Map<String, dynamic> json) =>
      _$MainInfoFromJson(json);

  Map<String, dynamic> toJson() => _$MainInfoToJson(this);
}

@JsonSerializable()
class PaginatedMainInfo {
  final int count;
  final String? previous, next;
  final List<MainInfo> results;

  PaginatedMainInfo({
    required this.count,
    this.previous,
    this.next,
    required this.results,
  });

  factory PaginatedMainInfo.fromJson(Map<String, dynamic> json) =>
      _$PaginatedMainInfoFromJson(json);

  Map<String, dynamic> toJson() => _$PaginatedMainInfoToJson(this);
}

@JsonSerializable()
class FAQ {
  final int id;
  final String title, description;

  FAQ({
    required this.id,
    required this.title,
    required this.description,
  });

  factory FAQ.fromJson(Map<String, dynamic> json) => _$FAQFromJson(json);

  Map<String, dynamic> toJson() => _$FAQToJson(this);
}

@JsonSerializable()
class PaginatedFAQ {
  final int count;
  final String? previous, next;
  final List<FAQ> results;

  PaginatedFAQ({
    required this.count,
    this.previous,
    this.next,
    required this.results,
  });

  factory PaginatedFAQ.fromJson(Map<String, dynamic> json) =>
      _$PaginatedFAQFromJson(json);

  Map<String, dynamic> toJson() => _$PaginatedFAQToJson(this);
}

@JsonSerializable()
class Services {
  final List<MainInfo> main_infos;
  final List<FAQ> faqs;
  final List<Inquiry>? inquiries;

  Services({
    required this.main_infos,
    required this.faqs,
    this.inquiries,
  });

  factory Services.fromJson(Map<String, dynamic> json) =>
      _$ServicesFromJson(json);

  Map<String, dynamic> toJson() => _$ServicesToJson(this);
}
