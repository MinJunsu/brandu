import 'package:brandu/models/account.dart';
import 'package:collection/collection.dart';
import 'package:get/get.dart';

class BasketController extends GetxController {
  List<int> _counts = [];
  List<Basket> _baskets = [];
  List<bool> _checkedList = [];
  int _orderPrice = 0;

  List<Basket> get baskets => _baskets;

  List<bool> get checkedList => _checkedList;

  List<int> get counts => _counts;

  int get orderPrice => _orderPrice;

  BasketController() {
    _checkedList = List<bool>.filled(_baskets.length, true);
    _counts = _baskets.map((e) => e.amount).toList();
    _orderPrice = _baskets
        .mapIndexed((index, element) => element.product.price * counts[index])
        .sum;
  }

  void toggleCheckedList(bool? isChecked) {
    _checkedList = List<bool>.filled(_checkedList.length, isChecked!);
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
