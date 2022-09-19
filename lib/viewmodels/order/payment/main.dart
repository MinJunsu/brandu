import 'package:get/get.dart';

class PaymentController extends GetxController {
  final RxBool _visibility = true.obs;
  final RxInt _selectedIndex = 0.obs;

  List<String> get payments => ['간편결제', '가상계좌', '카드결제', '핸드폰', '토스페이', '카카오페이'];

  bool get visibility => _visibility.value;

  int get selectedIndex => _selectedIndex.value;

  void toggleVisibility() {
    _visibility(!visibility);
  }

  void selectIndex(int index) {
    _selectedIndex(index);
  }
}
