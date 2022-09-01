// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Platform _$PlatformFromJson(Map<String, dynamic> json) => Platform(
      created: DateTime.parse(json['created'] as String),
      platform: json['platform'] as String,
    );

Map<String, dynamic> _$PlatformToJson(Platform instance) => <String, dynamic>{
      'created': instance.created.toIso8601String(),
      'platform': instance.platform,
    };

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      id: json['id'] as int,
      profile_image: json['profile_image'] as String?,
      nickname: json['nickname'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone_number: json['phone_number'] as String?,
      social_link: json['social_link'] as String?,
      description: json['description'] as String?,
      platforms: (json['platforms'] as List<dynamic>)
          .map((e) => Platform.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'id': instance.id,
      'profile_image': instance.profile_image,
      'nickname': instance.nickname,
      'name': instance.name,
      'email': instance.email,
      'phone_number': instance.phone_number,
      'social_link': instance.social_link,
      'description': instance.description,
      'platforms': instance.platforms,
    };

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      id: json['id'] as int,
      name: json['name'] as String,
      recipient: json['recipient'] as String,
      address: json['address'] as String,
      road_name_address: json['road_name_address'] as String,
      detail_address: json['detail_address'] as String,
      zip_code: json['zip_code'] as String,
      phone_number: json['phone_number'] as String,
      is_main: json['is_main'] as bool,
      memo: json['memo'] as String?,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'recipient': instance.recipient,
      'address': instance.address,
      'road_name_address': instance.road_name_address,
      'detail_address': instance.detail_address,
      'zip_code': instance.zip_code,
      'phone_number': instance.phone_number,
      'is_main': instance.is_main,
      'memo': instance.memo,
    };

Point _$PointFromJson(Map<String, dynamic> json) => Point(
      id: json['id'] as int,
      memo: json['memo'] as String,
      point: json['point'] as int,
      is_use: json['is_use'] as bool,
      created: DateTime.parse(json['created'] as String),
    );

Map<String, dynamic> _$PointToJson(Point instance) => <String, dynamic>{
      'id': instance.id,
      'memo': instance.memo,
      'point': instance.point,
      'is_use': instance.is_use,
      'created': instance.created.toIso8601String(),
    };

PointHistory _$PointHistoryFromJson(Map<String, dynamic> json) => PointHistory(
      point: json['point'] as int,
      point_history: (json['point_history'] as List<dynamic>)
          .map((e) => Point.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PointHistoryToJson(PointHistory instance) =>
    <String, dynamic>{
      'point': instance.point,
      'point_history': instance.point_history,
    };

Notify _$NotifyFromJson(Map<String, dynamic> json) => Notify(
      is_store: json['is_store'] as bool,
      is_community: json['is_community'] as bool,
      is_event: json['is_event'] as bool,
    );

Map<String, dynamic> _$NotifyToJson(Notify instance) => <String, dynamic>{
      'is_store': instance.is_store,
      'is_community': instance.is_community,
      'is_event': instance.is_event,
    };

Review _$ReviewFromJson(Map<String, dynamic> json) => Review(
      id: json['id'] as int,
      product_name: json['product_name'] as String,
      payment_day: DateTime.parse(json['payment_day'] as String),
      is_write: json['is_write'] as bool,
      star: json['star'] as int,
      description: json['description'] as String,
    );

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
      'id': instance.id,
      'product_name': instance.product_name,
      'payment_day': instance.payment_day.toIso8601String(),
      'is_write': instance.is_write,
      'star': instance.star,
      'description': instance.description,
    };

Bucket _$BucketFromJson(Map<String, dynamic> json) => Bucket(
      id: json['id'] as int,
      product: SimpleProduct.fromJson(json['product'] as Map<String, dynamic>),
      amount: json['amount'] as int,
      is_purchase: json['is_purchase'] as bool,
    );

Map<String, dynamic> _$BucketToJson(Bucket instance) => <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
      'amount': instance.amount,
      'is_purchase': instance.is_purchase,
    };
