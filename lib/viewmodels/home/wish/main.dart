import 'package:brandu/models/account.dart';
import 'package:brandu/services/accounts.dart';
import 'package:brandu/services/auth_dio.dart';
import 'package:brandu/viewmodels/home/basket/main.dart';
import 'package:get/get.dart';

class WishController extends GetxController {
  final RxList<Wish> _wishes = <Wish>[].obs;

  RxList<Wish> get wishes => _wishes;

  @override
  void onInit() {
    super.onInit();
    fetchWishes();
  }

  void addToBasket(int index) async {
    await AccountClient(await authDio()).postBaskets(_wishes[index].product.id);
    fetchWishes();
    Get.find<BasketController>().fetchBaskets();
  }

  void removeWish(int index) async {
    await AccountClient(await authDio())
        .deleteWishes(_wishes[index].product.id);
    fetchWishes();
  }

  void fetchWishes() async {
    List<Wish> wishes = await AccountClient(await authDio()).getWishes();
    _wishes(wishes);
  }
}
