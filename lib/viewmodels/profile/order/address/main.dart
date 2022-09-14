import 'package:brandu/models/account.dart';
import 'package:brandu/services/accounts.dart';
import 'package:brandu/services/auth_dio.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  final RxList<Address> _addresses = <Address>[].obs;

  RxList<Address> get addresses => _addresses;

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

  void onClick() {

  }
}
