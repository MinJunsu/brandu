import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CouponCreateController extends GetxController {
  String _keyword = '';
  late TextEditingController controller;

  String get keyword => _keyword;

  @override
  void onInit() {
    super.onInit();
    controller = TextEditingController();
    controller.addListener(setCouponNumber);
  }

  void setCouponNumber() {
    _keyword = controller.text;
  }

  void registerCoupon(String couponNumber) async {

  }
}
