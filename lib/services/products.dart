import 'package:brandu/models/product.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'products.g.dart';

@RestApi(baseUrl: 'http://127.0.0.1:8000/api/v1/products/')
abstract class ProductClient {
  factory ProductClient(Dio dio, {String baseUrl}) = _ProductClient;

  @GET('/hot-deal/')
  Future<List<SimpleProduct>> getHotDeals();

  @GET('/categories/')
  Future<List<MainCategory>> getMainCategories();

  @GET('/category/{id}/')
  Future<List<ProductsWithCategory>> getMainCategoryProducts(
      @Path("id") int id);

  @GET('/category/sub/{id}/')
  Future<List<SimpleProduct>> getSubCategoryProducts(@Path("id") int id);
}
