import 'package:brandu/components/color.dart';
import 'package:brandu/viewmodels/auth/login.dart';
import 'package:brandu/viewmodels/home/main.dart';
import 'package:brandu/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  static FlutterSecureStorage storage = const FlutterSecureStorage();

  void checkIsLogin() async {
    String? accessToken = await storage.read(key: 'ACCESS_TOKEN');
    if ((accessToken == null) && !Get.find<LoginController>().isLoginPass) {
      Get.toNamed('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    checkIsLogin();
    return Obx(
      () => Scaffold(
        appBar: CustomAppBar(
          appBar: AppBar(),
        ),
        body: controller.widgetOptions.elementAt(controller.navigatorIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: controller.items,
          currentIndex: controller.navigatorIndex,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: mainColor,
          unselectedItemColor: lightGreyColor,
          onTap: controller.onTap,
        ),
      ),
    );
  }
}
