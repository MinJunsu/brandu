import 'package:brandu/screens/profile/info/main.dart';
import 'package:brandu/screens/profile/order/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController controller;
  late List<Widget> tabHeaders;
  late List<Widget> tabs;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(length: 2, vsync: this);
    tabHeaders = [
      sizedTab("마이페이지"),
      sizedTab("주문/배송"),
    ];
    tabs = [
      ProfileInfoPage(),
      ProfileOrderPage(),
    ];
  }

  @override
  void onClose() {
    super.onClose();
    controller.dispose();
  }

  Widget sizedTab(String title) {
    return SizedBox(
      height: 40,
      child: Tab(
        text: title,
      ),
    );
  }
}
