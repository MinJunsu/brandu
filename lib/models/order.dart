import 'package:brandu/models/product.dart';

class Order {
  final int id;
  final Product product;
  final int count;

  const Order(this.id, this.product, this.count);

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(json['id'], Product.fromJson(json['product']), json['count']);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'product': product.toJson(),
        'count': count,
      };
}
