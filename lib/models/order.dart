import 'package:brandu/models/account.dart';
import 'package:brandu/models/product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

enum OrderType { paid, delivery, complete, confirm }

@JsonSerializable()
class OrderProduct {
  final SimpleProduct product;
  final int count;
  final int? option;
  final int? discount;

  const OrderProduct({
    required this.product,
    required this.count,
    this.option,
    this.discount,
  });

  factory OrderProduct.fromJson(Map<String, dynamic> json) =>
      _$OrderProductFromJson(json);

  Map<String, dynamic> toJson() => _$OrderProductToJson(this);
}

@JsonSerializable()
class Order {
  final int id;
  final int profile;
  final String name;
  final List<OrderProduct> products;
  final Address address;
  final String order_number;
  final int price;
  final OrderType status;
  final bool is_confirm;
  final DateTime created;

  const Order({
    required this.id,
    required this.profile,
    required this.name,
    required this.products,
    required this.address,
    required this.order_number,
    required this.price,
    required this.status,
    required this.is_confirm,
    required this.created,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
