import 'package:brandu/models/account.dart';
import 'package:brandu/services/accounts.dart';
import 'package:brandu/services/auth_dio.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  final RxBool _visibility = false.obs;
  final RxList<Address> _addresses = <Address>[].obs;
  final RxInt _addressIndex = 0.obs;

  bool get visibility => _visibility.value;

  List<Address> get addresses => _addresses;

  int get addressIndex => _addressIndex.value;

  @override
  void onInit() {
    super.onInit();
    fetchAddresses();
  }

  void fetchAddresses() async {
    List<Address> addresses =
        await AccountClient(await authDio()).getAddresses();
    _addresses(addresses);
  }

  void setAddressIndex(int index) {
    _addressIndex(index);
  }

  void toggleVisibility() {
    _visibility(!_visibility.value);
  }
}
