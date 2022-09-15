import 'package:brandu/models/account.dart';
import 'package:brandu/models/product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

enum OrderType { paid, delivery, complete, confirm }

@JsonSerializable()
class Order {
  final int id;
  final Profile profile;
  final Product product;
  final Address address;
  final String order_number;
  final int price;
  final OrderType status;
  final bool is_confirmed;
  final int count;

  const Order({
    required this.id,
    required this.profile,
    required this.product,
    required this.address,
    required this.order_number,
    required this.price,
    required this.status,
    required this.is_confirmed,
    required this.count,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
