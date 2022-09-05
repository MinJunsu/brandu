import 'package:brandu/components/color.dart';
import 'package:brandu/viewmodels/profile/order/shipping/main.dart';
import 'package:brandu/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShippingPage extends GetView<ShippingController> {
  const ShippingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        isBack: true,
        title: '주문/배송 조회',
      ),
      body: DefaultTabController(
        length: controller.tabHeaders.length,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: TabBar(
                  controller: controller.tabController,
                  indicatorSize: TabBarIndicatorSize.tab,
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
                controller: controller.tabController,
                children: [
                  Container(),
                  Container(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
