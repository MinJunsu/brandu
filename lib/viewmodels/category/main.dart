import 'package:brandu/models/product.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  List<MainCategory> _mainCategories = [];

  List<MainCategory> get mainCategories => _mainCategories;
}
