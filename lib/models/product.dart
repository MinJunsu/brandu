import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class SimpleProduct {
  final int id;
  final String? backdrop_image;
  final String name;
  final int price;
  final bool is_wish;

  SimpleProduct({
    required this.id,
    this.backdrop_image,
    required this.name,
    required this.price,
    required this.is_wish,
  });

  factory SimpleProduct.fromJson(Map<String, dynamic> json) =>
      _$SimpleProductFromJson(json);

  Map<String, dynamic> toJson() => _$SimpleProductToJson(this);
}

@JsonSerializable()
class Brand {
  final int id;
  final String name;
  final String? logo;

  Brand({
    required this.id,
    required this.name,
    this.logo,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);

  Map<String, dynamic> toJson() => _$BrandToJson(this);
}

@JsonSerializable()
class SubCategory {
  final int id;
  final String name;
  final String? backdrop_image;

  SubCategory({
    required this.id,
    required this.name,
    this.backdrop_image,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$SubCategoryToJson(this);
}

@JsonSerializable()
class MainCategory {
  final int id;
  final String name;
  final String? backdrop_image;
  final String color;
  final List<SubCategory> sub_categories;

  MainCategory({
    required this.id,
    required this.name,
    this.backdrop_image,
    required this.color,
    required this.sub_categories,
  });

  factory MainCategory.fromJson(Map<String, dynamic> json) =>
      _$MainCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$MainCategoryToJson(this);
}

@JsonSerializable()
class Product {
  final int id;
  final String name;
  final Brand brand;
  final SubCategory category;
  final String? backdrop_image;
  final int price;

  Product({
    required this.id,
    required this.name,
    required this.brand,
    required this.category,
    this.backdrop_image,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
