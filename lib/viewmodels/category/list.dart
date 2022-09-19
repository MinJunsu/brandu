import 'package:brandu/models/product.dart';
import 'package:brandu/services/products.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class CategoryListController extends GetxController {
  final RxList<SimpleProduct> _products = <SimpleProduct>[].obs;

  List<SimpleProduct> get products => _products;

  void fetchProducts(int id) async {
    List<SimpleProduct> products =
        await ProductClient(Dio()).getSubCategoryProducts(id);
    _products(products);
  }
}
