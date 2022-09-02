import 'package:brandu/models/product.dart';
import 'package:get/get.dart';

class StorePageViewModel extends GetxController {
  List<MainCategory> _categories = [];
  List<SimpleProduct> _hotDealProducts = [];
  List<SimpleProduct> _monthlyProducts = [];

  List<MainCategory> get categories => _categories;

  List<SimpleProduct> get hotDealProducts => _hotDealProducts;

  List<SimpleProduct> get monthlyProducts => _monthlyProducts;

  StorePageViewModel() {
    getCategories();
    getHotDealProducts();
  }

  getHotDealProducts() async {}

  getCategories() async {}
}
