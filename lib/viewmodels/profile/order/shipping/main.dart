import 'package:brandu/widgets/base/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShippingController extends GetxController
    with GetTickerProviderStateMixin {
  late TabController _tabController;
  List<Widget> _tabHeaders = [];

  TabController get tabController => _tabController;

  List<Widget> get tabHeaders => _tabHeaders;

  @override
  void onInit() {
    super.onInit();
    _tabController = TabController(length: 2, vsync: this);
    _tabHeaders = [
      SizedBox(
        height: 100,
        child: Tab(
          child: CustomIconButton(
            onPressed: () {},
            icon: 'assets/icons/bill.svg',
            title: '전체',
            count: 1,
          ),
        ),
      ),
      SizedBox(
        height: 100,
        child: Tab(
          child: CustomIconButton(
            onPressed: () {},
            icon: 'assets/icons/bill.svg',
            title: '전체',
            count: 1,
          ),
        ),
      ),
    ];
  }
}
