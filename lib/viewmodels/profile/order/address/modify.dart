import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddressModifyController extends GetxController {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _name = '';
  String _recipient = '';
  String _phoneNumber = '';
  String _address = '';
  String _zipCode = '';
  String _roadAddress = '';
  String _detailAddress = '';
  bool _isMain = false;

  GlobalKey<FormState> get formKey => _formKey;

  bool get isMain => _isMain;

  String get detailAddress => _detailAddress;

  String get roadAddress => _roadAddress;

  String get zipCode => _zipCode;

  String get address => _address;

  String get phoneNumber => _phoneNumber;

  String get recipient => _recipient;

  String get name => _name;

  void onSubmit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (_isMain) {}
    }
  }

  void setName(String? name) {
    _name = name!;
  }

  void setRecipient(String? recipient) {
    _recipient = recipient!;
  }

  void setPhoneNumber(String? phoneNumber) {
    _phoneNumber = phoneNumber!;
  }

  void setAddress(String? address) {
    _address = address!;
  }

  void setZipCode(String? zipCode) {
    _zipCode = zipCode!;
  }

  void setRoadAddress(String? roadAddress) {
    _roadAddress = roadAddress!;
  }

  void setDetailAddress(String? detailAddress) {
    _detailAddress = detailAddress!;
  }

  void setIsMain(bool? isChecked) {
    _isMain = isChecked!;
  }
}
