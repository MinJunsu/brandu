import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageViewModel extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController controller;
  late List<Widget> tabHeaders;
  late List<Widget> tabs;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(length: 5, vsync: this);
    tabHeaders = [
      sizedTab('스토어'),
      sizedTab('커뮤니티'),
      sizedTab('찜한상품'),
      sizedTab('장바구니'),
      sizedTab('스크랩북'),
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
