import 'package:brandu/models/product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account.g.dart';

@JsonSerializable()
class Platform {
  final DateTime created;
  final String platform;

  Platform({
    required this.created,
    required this.platform,
  });

  factory Platform.fromJson(Map<String, dynamic> json) =>
      _$PlatformFromJson(json);

  Map<String, dynamic> toJson() => _$PlatformToJson(this);
}

@JsonSerializable()
class Profile {
  final int? id;
  final String? profile_image,
      nickname,
      name,
      email,
      phone_number,
      social_link,
      description;
  final List<Platform>? platforms;

  Profile({
    this.id,
    this.profile_image,
    this.nickname,
    this.name,
    this.email,
    this.phone_number,
    this.social_link,
    this.description,
    this.platforms,
  });

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}

@JsonSerializable()
class Address {
  final int id;
  final String name,
      recipient,
      address,
      road_name_address,
      detail_address,
      zip_code,
      phone_number;
  final bool is_main;
  final String? memo;

  Address({
    required this.id,
    required this.name,
    required this.recipient,
    required this.address,
    required this.road_name_address,
    required this.detail_address,
    required this.zip_code,
    required this.phone_number,
    required this.is_main,
    this.memo,
  });

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

@JsonSerializable()
class Point {
  final int id;
  final String memo;
  final int point;
  final bool is_use;
  final DateTime created;

  Point({
    required this.id,
    required this.memo,
    required this.point,
    required this.is_use,
    required this.created,
  });

  factory Point.fromJson(Map<String, dynamic> json) => _$PointFromJson(json);

  Map<String, dynamic> toJson() => _$PointToJson(this);
}

@JsonSerializable()
class PointHistory {
  final int point;
  final List<Point> point_history;

  PointHistory({
    required this.point,
    required this.point_history,
  });

  factory PointHistory.fromJson(Map<String, dynamic> json) =>
      _$PointHistoryFromJson(json);

  Map<String, dynamic> toJson() => _$PointHistoryToJson(this);
}

@JsonSerializable()
class Notify {
  final bool is_store;
  final bool is_community;
  final bool is_event;

  Notify({
    required this.is_store,
    required this.is_community,
    required this.is_event,
  });

  factory Notify.fromJson(Map<String, dynamic> json) => _$NotifyFromJson(json);

  Map<String, dynamic> toJson() => _$NotifyToJson(this);
}

@JsonSerializable()
class Review {
  final int id;
  final String product_name;
  final DateTime payment_day;
  final bool is_write;
  final int star;
  final String description;

  Review({
    required this.id,
    required this.product_name,
    required this.payment_day,
    required this.is_write,
    required this.star,
    required this.description,
  });

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}

@JsonSerializable()
class Wish {
  final int id;
  final SimpleProduct product;
  final bool is_basket;

  Wish({
    required this.id,
    required this.product,
    required this.is_basket,
  });

  factory Wish.fromJson(Map<String, dynamic> json) => _$WishFromJson(json);

  Map<String, dynamic> toJson() => _$WishToJson(this);
}

@JsonSerializable()
class Basket {
  final int id;
  final SimpleProduct product;
  final int amount;
  final bool is_purchase;

  Basket({
    required this.id,
    required this.product,
    required this.amount,
    required this.is_purchase,
  });

  factory Basket.fromJson(Map<String, dynamic> json) => _$BasketFromJson(json);

  Map<String, dynamic> toJson() => _$BasketToJson(this);
}

@JsonSerializable()
class ProfileMySummary {
  final int wish;
  final int basket;
  final int scrap;
  final int coupon;
  final int point;

  ProfileMySummary({
    required this.wish,
    required this.basket,
    required this.scrap,
    required this.coupon,
    required this.point,
  });

  factory ProfileMySummary.fromJson(Map<String, dynamic> json) =>
      _$ProfileMySummaryFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileMySummaryToJson(this);
}

@JsonSerializable()
class ProfileOrderSummary {
  final int all;
  final int paid;
  final int delivery;
  final int complete;
  final int confirm;

  ProfileOrderSummary({
    required this.all,
    required this.paid,
    required this.delivery,
    required this.complete,
    required this.confirm,
  });

  factory ProfileOrderSummary.fromJson(Map<String, dynamic> json) =>
      _$ProfileOrderSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileOrderSummaryToJson(this);
}

@JsonSerializable()
class ProfileSummary {
  final ProfileMySummary my;
  final ProfileOrderSummary orders;

  ProfileSummary({
    required this.my,
    required this.orders,
  });

  factory ProfileSummary.fromJson(Map<String, dynamic> json) =>
      _$ProfileSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileSummaryToJson(this);
}
