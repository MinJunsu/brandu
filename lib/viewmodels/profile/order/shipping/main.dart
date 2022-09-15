import 'package:brandu/widgets/base/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShippingController extends GetxController
    with GetTickerProviderStateMixin {
  late TabController _tabController;
  final RxList<Widget> _tabHeaders = <Widget>[].obs;
  final RxInt _index = 0.obs;

  TabController get tabController => _tabController;

  int get index => _index.value;

  List<Widget> get tabHeaders => _tabHeaders;

  @override
  void onInit() {
    super.onInit();
    _tabController = TabController(length: 5, vsync: this);
    setTabHeaders(index);
  }

  void setTabHeaders(int page) {
    _index(page);
    List<Widget> tabHeaders = [
      sizedTab(
        title: '전체',
        onPressed: () {},
        icon: 'assets/icons/bill.svg',
        count: 5,
        active: index == 0,
      ),
      sizedTab(
        title: '결제완료',
        onPressed: () {},
        icon: 'assets/icons/complete-payment.svg',
        count: 1,
        active: index == 1,
      ),
      sizedTab(
        title: '배송 중',
        onPressed: () {},
        icon: 'assets/icons/shipping.svg',
        count: 1,
        active: index == 2,
      ),
      sizedTab(
        title: '배송 완료',
        onPressed: () {},
        icon: 'assets/icons/shipping-complete.svg',
        count: 1,
        active: index == 3,
      ),
      sizedTab(
        title: '구매확정',
        onPressed: () {},
        icon: 'assets/icons/confirm.svg',
        count: 1,
        active: index == 4,
      ),
    ];
    _tabHeaders(tabHeaders);
  }

  Widget sizedTab({
    required String title,
    required Function() onPressed,
    required String icon,
    required int count,
    required bool active,
  }) {
    return SizedBox(
      width: 70,
      height: 100,
      child: Tab(
        child: CustomIconButton(
          onPressed: onPressed,
          icon: icon,
          title: title,
          count: count,
          active: active,
        ),
      ),
    );
  }
}
