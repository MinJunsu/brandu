import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePageViewModel extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController controller;
  late List<Widget> tabHeaders;
  late List<Widget> tabs;

  ProfilePageViewModel() {
    tabHeaders = [
      sizedTab("마이페이지"),
      sizedTab("주문/배송"),
    ];
  }

  @override
  void onInit() {
    super.onInit();
    controller = TabController(length: tabHeaders.length, vsync: this);
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
