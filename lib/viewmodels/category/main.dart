import 'package:brandu/models/product.dart';
import 'package:brandu/services/products.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  final RxList<MainCategory> _mainCategories = <MainCategory>[].obs;
  final RxInt _index = 0.obs;

  List<MainCategory> get mainCategories => _mainCategories;

  int get index => _index.value;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  void fetchCategories() async {
    List<MainCategory> categories =
        await ProductClient(Dio()).getMainCategories();
    _mainCategories(categories);
  }

  void selectPage(int page) {
    _index(page);
  }
}
