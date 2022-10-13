import 'package:brandu/viewmodels/basket/main.dart';
import 'package:brandu/viewmodels/home/store/main.dart';
import 'package:brandu/viewmodels/home/wish/main.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StoreController());
    Get.lazyPut(() => BasketController());
    Get.lazyPut(() => WishController());
  }
}
