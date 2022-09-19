import 'package:brandu/models/account.dart';
import 'package:brandu/models/order.dart';
import 'package:brandu/services/accounts.dart';
import 'package:brandu/services/auth_dio.dart';
import 'package:brandu/viewmodels/profile/main.dart';
import 'package:brandu/widgets/base/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShippingController extends GetxController
    with GetTickerProviderStateMixin {
  late TabController _tabController;
  final RxList<Widget> _tabHeaders = <Widget>[].obs;
  final RxList<Order> _orders = <Order>[].obs;
  final RxInt _index = 0.obs;

  TabController get tabController => _tabController;

  int get index => _index.value;

  List<Widget> get tabHeaders => _tabHeaders;

  List<Order> get orders => _orders;

  List<Order> get paidOrder =>
      _orders.where((order) => order.status == OrderType.paid).toList();

  List<Order> get deliveryOrder =>
      _orders.where((order) => order.status == OrderType.delivery).toList();

  List<Order> get completeOrder =>
      _orders.where((order) => order.status == OrderType.complete).toList();

  List<Order> get confirmOrder =>
      _orders.where((order) => order.status == OrderType.confirm).toList();

  @override
  void onInit() {
    super.onInit();
    _tabController = TabController(length: 5, vsync: this);
    setTabHeaders(index);
    fetchOrders();
  }

  void fetchOrders() async {
    List<Order> orders = await AccountClient(await authDio()).getOrders();
    _orders(orders);
  }

  void setTabHeaders(int page) {
    ProfileSummary profileSummary =
        Get.find<ProfileController>().profileSummary;
    _index(page);
    List<Widget> tabHeaders = [
      sizedTab(
        title: '전체',
        onPressed: () {},
        icon: 'assets/icons/bill.svg',
        count: profileSummary.orders.all,
        active: index == 0,
      ),
      sizedTab(
        title: '결제완료',
        onPressed: () {},
        icon: 'assets/icons/complete-payment.svg',
        count: profileSummary.orders.paid,
        active: index == 1,
      ),
      sizedTab(
        title: '배송 중',
        onPressed: () {},
        icon: 'assets/icons/shipping.svg',
        count: profileSummary.orders.delivery,
        active: index == 2,
      ),
      sizedTab(
        title: '배송 완료',
        onPressed: () {},
        icon: 'assets/icons/shipping-complete.svg',
        count: profileSummary.orders.complete,
        active: index == 3,
      ),
      sizedTab(
        title: '구매확정',
        onPressed: () {},
        icon: 'assets/icons/confirm.svg',
        count: profileSummary.orders.confirm,
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
