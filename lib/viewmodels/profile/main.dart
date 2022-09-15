import 'package:brandu/models/account.dart';
import 'package:brandu/screens/profile/info/main.dart';
import 'package:brandu/screens/profile/order/main.dart';
import 'package:brandu/services/accounts.dart';
import 'package:brandu/services/auth_dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final Rx<ProfileSummary> _profileSummary = ProfileSummary(
    my: ProfileMySummary(
      wish: 0,
      basket: 0,
      scrap: 0,
      coupon: 0,
      point: 0,
    ),
    orders: ProfileOrderSummary(
      all: 0,
      paid: 0,
      delivery: 0,
      complete: 0,
      confirm: 0,
    ),
  ).obs;

  late TabController controller;
  late List<Widget> tabHeaders;
  late List<Widget> tabs;

  final FlutterSecureStorage storage = const FlutterSecureStorage();

  ProfileSummary get profileSummary => _profileSummary.value;

  @override
  void onInit() {
    super.onInit();
    fetchProfileSummary();
    controller = TabController(length: 2, vsync: this);
    tabHeaders = [
      sizedTab("마이페이지"),
      sizedTab("주문/배송"),
    ];
    tabs = const [
      ProfileInfoPage(),
      ProfileOrderPage(),
    ];
  }

  Future<bool> isAuthenticated() async {
    String? accessToken = await storage.read(key: 'ACCESS_TOKEN');
    return accessToken != null;
  }

  void fetchProfileSummary() async {
    ProfileSummary summary =
        await AccountClient(await authDio()).getProfileSummary();
    _profileSummary(summary);
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
