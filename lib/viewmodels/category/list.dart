import 'package:brandu/models/product.dart';
import 'package:brandu/services/products.dart';
import 'package:brandu/viewmodels/main.dart';
import 'package:brandu/widgets/products/list-box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryListController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final RxBool _isLoading = true.obs;
  late TabController controller;
  late List<Widget> tabHeaders;
  late List<Widget> tabs;
  final RxList<ProductsWithCategory> _products = <ProductsWithCategory>[].obs;

  bool get isLoading => _isLoading.value;

  List<ProductsWithCategory> get products => _products;

  void fetchProducts(int id, int index) async {
    List<ProductsWithCategory> products =
        await ProductClient(await Get.find<BaseController>().getAuthDioOrDio())
            .getMainCategoryProducts(id);
    _products(products);
    controller = TabController(length: products.length, vsync: this);
    tabHeaders = products.map((product) => sizedTab(product.category)).toList();
    tabs = products
        .map((product) => ProductListBox(products: product.products))
        .toList();
    _isLoading(false);
    controller.animateTo(index);
  }

  Widget sizedTab(String title) {
    return SizedBox(
      height: 40,
      child: Tab(
        text: title,
      ),
    );
  }
}
