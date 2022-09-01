import 'package:brandu/models/product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event.g.dart';

@JsonSerializable()
class CouponCoverage {
  final SimpleProduct product;

  CouponCoverage({
    required this.product,
  });

  factory CouponCoverage.fromJson(Map<String, dynamic> json) =>
      _$CouponCoverageFromJson(json);

  Map<String, dynamic> toJson() => _$CouponCoverageToJson(this);
}

@JsonSerializable()
class Coupon {
  final String name;
  final DateTime usable_period;
  final int expiration_period;
  final List<CouponCoverage> coverage;

  Coupon({
    required this.name,
    required this.expiration_period,
    required this.usable_period,
    required this.coverage,
  });

  factory Coupon.fromJson(Map<String, dynamic> json) => _$CouponFromJson(json);

  Map<String, dynamic> toJson() => _$CouponToJson(this);
}

@JsonSerializable()
class CouponHold {
  final int id;
  final Coupon coupon;
  final DateTime created;
  final bool is_use;

  CouponHold({
    required this.id,
    required this.coupon,
    required this.created,
    required this.is_use,
  });

  factory CouponHold.fromJson(Map<String, dynamic> json) =>
      _$CouponHoldFromJson(json);

  Map<String, dynamic> toJson() => _$CouponHoldToJson(this);
}
