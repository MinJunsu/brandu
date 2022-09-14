import 'package:brandu/models/account.dart';
import 'package:brandu/services/accounts.dart';
import 'package:brandu/services/auth_dio.dart';
import 'package:brandu/viewmodels/profile/order/address/main.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddressFormController extends GetxController {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _addressController;
  final RxString _name = ''.obs;
  final RxString _recipient = ''.obs;
  final RxString _phoneNumber = ''.obs;
  final RxString _address = ''.obs;
  final RxString _zipCode = ''.obs;
  final RxString _roadAddress = ''.obs;
  final RxString _detailAddress = ''.obs;
  final RxBool _isMain = false.obs;
  int id = 0;
  bool _isCreate = true;

  GlobalKey<FormState> get formKey => _formKey;

  TextEditingController get addressController => _addressController;

  bool get isMain => _isMain.value;

  String get detailAddress => _detailAddress.value;

  String get roadAddress => _roadAddress.value;

  String get zipCode => _zipCode.value;

  String get address => _address.value;

  String get phoneNumber => _phoneNumber.value;

  String get recipient => _recipient.value;

  String get name => _name.value;

  @override
  void onInit() {
    super.onInit();
    _addressController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _addressController.dispose();
  }

  void onSubmit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Address returnAddress;
      Address newAddress = Address(
        id: id,
        name: name,
        recipient: recipient,
        address: address,
        road_name_address: roadAddress,
        detail_address: detailAddress,
        zip_code: zipCode,
        phone_number: phoneNumber,
        is_main: false,
      );
      if (_isCreate) {
        returnAddress =
        await AccountClient(await authDio()).postAddresses(newAddress);
      } else {
        returnAddress =
        await AccountClient(await authDio()).patchAddress(id, newAddress);
      }
      if (_isMain.value) {
        await AccountClient(await authDio()).patchAddressMain(returnAddress.id);
      }
      Get.find<AddressController>().fetchAddresses();
    }
  }

  void setDefaultValue(Address address) {
    id = address.id;
    _name(address.name);
    _recipient(address.recipient);
    _phoneNumber(address.phone_number);
    _address(address.address);
    _zipCode(address.zip_code);
    _roadAddress(address.road_name_address);
    _detailAddress(address.detail_address);
    _isMain(address.is_main);
    _addressController.text = address.road_name_address;
  }

  void setIsUpdate() {
    _isCreate = false;
  }

  void setName(String? name) {
    _name(name!);
  }

  void setRecipient(String? recipient) {
    _recipient(recipient!);
  }

  void setPhoneNumber(String? phoneNumber) {
    _phoneNumber(phoneNumber!);
  }

  void setAddress(String? address) {
    _address(address!);
  }

  void setZipCode(String? zipCode) {
    _zipCode(zipCode!);
  }

  void setRoadAddress(String? roadAddress) {
    _addressController.text = roadAddress!;
    _roadAddress(roadAddress);
  }

  void setDetailAddress(String? detailAddress) {
    _detailAddress(detailAddress!);
  }

  void setIsMain(bool? isChecked) {
    print(roadAddress);
    _isMain(isChecked!);
  }
}
