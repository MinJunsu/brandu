// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CouponCoverage _$CouponCoverageFromJson(Map<String, dynamic> json) =>
    CouponCoverage(
      product: SimpleProduct.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CouponCoverageToJson(CouponCoverage instance) =>
    <String, dynamic>{
      'product': instance.product,
    };

Coupon _$CouponFromJson(Map<String, dynamic> json) => Coupon(
      name: json['name'] as String,
      expiration_period: json['expiration_period'] as int,
      usable_period: DateTime.parse(json['usable_period'] as String),
      coverage: (json['coverage'] as List<dynamic>)
          .map((e) => CouponCoverage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CouponToJson(Coupon instance) => <String, dynamic>{
      'name': instance.name,
      'usable_period': instance.usable_period.toIso8601String(),
      'expiration_period': instance.expiration_period,
      'coverage': instance.coverage,
    };

CouponHold _$CouponHoldFromJson(Map<String, dynamic> json) => CouponHold(
      id: json['id'] as int,
      coupon: Coupon.fromJson(json['coupon'] as Map<String, dynamic>),
      created: DateTime.parse(json['created'] as String),
      is_use: json['is_use'] as bool,
    );

Map<String, dynamic> _$CouponHoldToJson(CouponHold instance) =>
    <String, dynamic>{
      'id': instance.id,
      'coupon': instance.coupon,
      'created': instance.created.toIso8601String(),
      'is_use': instance.is_use,
    };

Advertisement _$AdvertisementFromJson(Map<String, dynamic> json) =>
    Advertisement(
      id: json['id'] as int,
      title: json['title'] as String,
      backdrop_image: json['backdrop_image'] as String,
      link: json['link'] as String,
    );

Map<String, dynamic> _$AdvertisementToJson(Advertisement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'backdrop_image': instance.backdrop_image,
      'link': instance.link,
    };
