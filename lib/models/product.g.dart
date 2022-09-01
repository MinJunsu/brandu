// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SimpleProduct _$SimpleProductFromJson(Map<String, dynamic> json) =>
    SimpleProduct(
      id: json['id'] as int,
      backdrop_image: json['backdrop_image'] as String?,
      name: json['name'] as String,
      price: json['price'] as int,
      is_wish: json['is_wish'] as bool,
    );

Map<String, dynamic> _$SimpleProductToJson(SimpleProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'backdrop_image': instance.backdrop_image,
      'name': instance.name,
      'price': instance.price,
      'is_wish': instance.is_wish,
    };

Brand _$BrandFromJson(Map<String, dynamic> json) => Brand(
      id: json['id'] as int,
      name: json['name'] as String,
      logo: json['logo'] as String?,
    );

Map<String, dynamic> _$BrandToJson(Brand instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
    };

SubCategory _$SubCategoryFromJson(Map<String, dynamic> json) => SubCategory(
      id: json['id'] as int,
      name: json['name'] as String,
      backdrop_image: json['backdrop_image'] as String?,
    );

Map<String, dynamic> _$SubCategoryToJson(SubCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'backdrop_image': instance.backdrop_image,
    };

MainCategory _$MainCategoryFromJson(Map<String, dynamic> json) => MainCategory(
      id: json['id'] as int,
      name: json['name'] as String,
      backdrop_image: json['backdrop_image'] as String?,
      color: json['color'] as String,
      sub_categories: (json['sub_categories'] as List<dynamic>)
          .map((e) => SubCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MainCategoryToJson(MainCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'backdrop_image': instance.backdrop_image,
      'color': instance.color,
      'sub_categories': instance.sub_categories,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as int,
      name: json['name'] as String,
      brand: Brand.fromJson(json['brand'] as Map<String, dynamic>),
      category: SubCategory.fromJson(json['category'] as Map<String, dynamic>),
      backdrop_image: json['backdrop_image'] as String?,
      price: json['price'] as int,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'brand': instance.brand,
      'category': instance.category,
      'backdrop_image': instance.backdrop_image,
      'price': instance.price,
    };
