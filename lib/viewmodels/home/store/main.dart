import 'package:brandu/models/event.dart';
import 'package:brandu/models/product.dart';
import 'package:brandu/services/accounts.dart';
import 'package:brandu/services/auth_dio.dart';
import 'package:brandu/services/events.dart';
import 'package:brandu/services/products.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class StoreController extends GetxController {
  final RxList<Advertisement> _carousels = <Advertisement>[].obs;
  final RxList<MainCategory> _categories = <MainCategory>[].obs;
  final RxList<SimpleProduct> _hotDealProducts = <SimpleProduct>[].obs;
  final RxList<SimpleProduct> _monthlyProducts = <SimpleProduct>[].obs;

  RxList<Advertisement> get carousels => _carousels;

  RxList<MainCategory> get categories => _categories;

  RxList<SimpleProduct> get hotDealProducts => _hotDealProducts;

  RxList<SimpleProduct> get monthlyProducts => _monthlyProducts;

  @override
  void onInit() {
    super.onInit();
    fetchCarousels();
    fetchCategories();
    fetchHotDealProducts();
  }

  void addToWishList(int id) async {
    await AccountClient(await authDio()).postWishes(id);
    fetchHotDealProducts();
  }

  fetchCarousels() async {
    Dio dio = Dio();
    List<Advertisement> carousels = await EventClient(dio).getCarousel();
    _carousels(carousels);
  }

  fetchHotDealProducts() async {
    Dio dio = Dio();
    List<SimpleProduct> products = await ProductClient(dio).getHotDeals();
    _hotDealProducts(products);
  }

  fetchCategories() async {
    Dio dio = Dio();
    List<MainCategory> categories =
        await ProductClient(dio).getMainCategories();
    _categories(categories);
  }
}
