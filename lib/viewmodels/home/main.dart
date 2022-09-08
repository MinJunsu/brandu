import 'package:brandu/screens/home/basket/main.dart';
import 'package:brandu/screens/home/community/main.dart';
import 'package:brandu/screens/home/store/main.dart';
import 'package:brandu/screens/home/wish/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
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
    tabs = [
      StorePage(),
      CommunityPage(),
      WishPage(),
      BasketPage(),
      Container(),
    ];
  }

  void goBasketPage() {
    controller.animateTo(3);
  }

  void goWishPage() {
    controller.animateTo(2);
  }

  void goScrapBook() {
    controller.animateTo(4);
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
