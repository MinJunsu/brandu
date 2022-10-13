import 'package:brandu/models/account.dart';
import 'package:brandu/services/accounts.dart';
import 'package:brandu/services/auth_dio.dart';
import 'package:brandu/viewmodels/home/wish/main.dart';
import 'package:collection/collection.dart';
import 'package:get/get.dart';

class BasketController extends GetxController {
  final RxList<int> _counts = <int>[].obs;
  final RxList<Basket> _baskets = <Basket>[].obs;
  final RxList<bool> _checkedList = <bool>[].obs;

  List<Basket> get baskets => _baskets;

  List<bool> get checkedList => _checkedList;

  RxList<int> get counts => _counts;

  int get selectedCount => _checkedList.where((element) => element).length;

  int get orderPrice => _baskets
      .whereIndexed((index, element) => checkedList[index])
      .mapIndexed((index, element) => element.product.price * _counts[index])
      .sum;

  @override
  void onInit() {
    super.onInit();
    fetchBaskets();
  }

  void fetchBaskets() async {
    List<Basket> baskets = await AccountClient(await authDio()).getBaskets();
    _baskets(baskets);
    initializerList();
  }

  void initializerList() {
    _checkedList(List<bool>.filled(_baskets.length, true));
    _counts(_baskets.map((e) => e.amount).toList());
  }

  void toggleCheckedListIndex(int index, bool? isChecked) {
    _checkedList[index] = isChecked!;
  }

  void removeBasket(int index) async {
    await AccountClient(await authDio())
        .deleteBaskets(_baskets[index].product.id);
    fetchBaskets();
    Get.find<WishController>().fetchWishes();
  }

  void toggleCheckedList(bool? isChecked) {
    _checkedList(List<bool>.filled(_checkedList.length, isChecked!));
  }

  void incrementCount(int index) {
    _counts[index]++;
  }

  void decrementCount(int index) {
    if (_counts[index] > 1) {
      _counts[index]--;
    }
  }
}
