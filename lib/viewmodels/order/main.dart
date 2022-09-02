import 'package:brandu/models/account.dart';
import 'package:get/get.dart';

class OrderPageViewModel extends GetxController {
  bool _visibility = false;
  List<Address> _addresses = [];
  int _addressIndex = 0;

  bool get visibility => _visibility;

  List<Address> get addresses => _addresses;

  int get addressIndex => _addressIndex;

  void setAddressIndex(int index) {
    _addressIndex = index;
  }

  void toggleVisibility() {
    _visibility = !_visibility;
  }
}
