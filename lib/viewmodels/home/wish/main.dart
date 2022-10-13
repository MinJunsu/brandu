import 'package:brandu/models/account.dart';
import 'package:brandu/services/accounts.dart';
import 'package:brandu/services/auth_dio.dart';
import 'package:get/get.dart';

class WishController extends GetxController {
  final RxList<Wish> _wishes = <Wish>[].obs;
  final RxBool _isLoading = true.obs;

  RxList<Wish> get wishes => _wishes;

  int get wishCount => _wishes.length;

  bool get isLoading => _isLoading.value;

  @override
  void onInit() {
    super.onInit();
  }

  void addToBasket(int index) async {
    await AccountClient(await authDio()).postBaskets(_wishes[index].product.id);
    fetchWishes();
  }

  void removeWish(int index) async {
    await AccountClient(await authDio())
        .deleteWishes(_wishes[index].product.id);
    _wishes.removeAt(index);
  }

  void fetchWishes() async {
    _isLoading(true);
    List<Wish> wishes = await AccountClient(await authDio()).getWishes();
    _wishes(wishes);
    _isLoading(false);
  }
}
