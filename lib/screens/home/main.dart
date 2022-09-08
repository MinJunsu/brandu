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
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
      ),
      body: DefaultTabController(
        length: controller.tabs.length,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: lightGreyColor,
                    blurRadius: 15.0,
                    offset: Offset(0.0, 0.75),
                  ),
                ],
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: TabBar(
                  controller: controller.controller,
                  labelPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: 2,
                  indicatorColor: mainColor,
                  labelColor: mainColor,
                  unselectedLabelColor: greyColor,
                  isScrollable: true,
                  labelStyle: const TextStyle(
                    fontFamily: 'Noto Sans KR',
                    fontSize: 14,
                    height: 1.4,
                    letterSpacing: -0.5,
                    wordSpacing: -0.5,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.none,
                  ),
                  unselectedLabelStyle: const TextStyle(
                    fontFamily: 'Noto Sans KR',
                    fontSize: 14,
                    height: 1.4,
                    letterSpacing: -0.5,
                    wordSpacing: -0.5,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.none,
                  ),
                  tabs: controller.tabHeaders,
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: controller.controller,
                children: controller.tabs,
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     ScaffoldMessenger.of(context)
      //         .showSnackBar(const SnackBar(content: Text('123')));
      //     // Get.to(() => const BucketPage());
      //   },
      //   backgroundColor: mainColor,
      //   child: SvgPicture.asset('assets/icons/bucket.svg'),
      // ),
    );
  }
}
