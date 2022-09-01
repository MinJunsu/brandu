// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notice _$NoticeFromJson(Map<String, dynamic> json) => Notice(
      id: json['id'] as int,
      created: DateTime.parse(json['created'] as String),
      title: json['title'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$NoticeToJson(Notice instance) => <String, dynamic>{
      'id': instance.id,
      'created': instance.created.toIso8601String(),
      'title': instance.title,
      'description': instance.description,
    };

Inquiry _$InquiryFromJson(Map<String, dynamic> json) => Inquiry(
      id: json['id'] as int,
      created: DateTime.parse(json['created'] as String),
      title: json['title'] as String,
      description: json['description'] as String,
      is_answer: json['is_answer'] as bool,
    );

Map<String, dynamic> _$InquiryToJson(Inquiry instance) => <String, dynamic>{
      'id': instance.id,
      'created': instance.created.toIso8601String(),
      'title': instance.title,
      'description': instance.description,
      'is_answer': instance.is_answer,
    };

MainInfo _$MainInfoFromJson(Map<String, dynamic> json) => MainInfo(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$MainInfoToJson(MainInfo instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
    };

PaginatedMainInfo _$PaginatedMainInfoFromJson(Map<String, dynamic> json) =>
    PaginatedMainInfo(
      count: json['count'] as int,
      previous: json['previous'] as String?,
      next: json['next'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => MainInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PaginatedMainInfoToJson(PaginatedMainInfo instance) =>
    <String, dynamic>{
      'count': instance.count,
      'previous': instance.previous,
      'next': instance.next,
      'results': instance.results,
    };

FAQ _$FAQFromJson(Map<String, dynamic> json) => FAQ(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$FAQToJson(FAQ instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
    };

PaginatedFAQ _$PaginatedFAQFromJson(Map<String, dynamic> json) => PaginatedFAQ(
      count: json['count'] as int,
      previous: json['previous'] as String?,
      next: json['next'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => FAQ.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PaginatedFAQToJson(PaginatedFAQ instance) =>
    <String, dynamic>{
      'count': instance.count,
      'previous': instance.previous,
      'next': instance.next,
      'results': instance.results,
    };

Services _$ServicesFromJson(Map<String, dynamic> json) => Services(
      main_infos: (json['main_infos'] as List<dynamic>)
          .map((e) => MainInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      faqs: (json['faqs'] as List<dynamic>)
          .map((e) => FAQ.fromJson(e as Map<String, dynamic>))
          .toList(),
      inquiries: (json['inquiries'] as List<dynamic>?)
          ?.map((e) => Inquiry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ServicesToJson(Services instance) => <String, dynamic>{
      'main_infos': instance.main_infos,
      'faqs': instance.faqs,
      'inquiries': instance.inquiries,
    };
