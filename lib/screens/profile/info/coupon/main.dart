import 'package:brandu/components/color.dart';
import 'package:brandu/components/icon.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/utils/format.dart';
import 'package:brandu/viewmodels/profile/info/coupon/main.dart';
import 'package:brandu/widgets/appbar.dart';
import 'package:brandu/widgets/base/border.dart';
import 'package:brandu/widgets/base/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CouponPage extends GetView<CouponController> {
  const CouponPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: Row(
          children: [
            backIcon(),
            homeIcon(),
          ],
        ),
        appBar: AppBar(),
        title: '쿠폰 내역',
        actions: const <Widget>[],
      ),
      body: Obx(
        () => Column(
          children: [
            Container(
              width: double.infinity,
              decoration: borderBottom(),
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: NotoText(
                  '보유 쿠폰 ${controller.coupons.length}개',
                  size: 14,
                  color: Colors.black,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: borderBottom(),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                NotoText(
                                  controller.coupons[index].coupon.name,
                                  size: 16,
                                  color: Colors.black,
                                ),
                                const NotoText(
                                  '적용상품 목록',
                                  size: 12,
                                  color: greyColor,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            NotoText(
                              '${baseDateFormat.format(controller.coupons[index].created)}~${baseDateFormat.format(
                                controller.coupons[index].created.add(
                                  Duration(
                                    days: controller.coupons[index].coupon
                                        .expiration_period,
                                  ),
                                ),
                              )}',
                              size: 14,
                              color: greyColor,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Container();
                  },
                  itemCount: controller.coupons.length,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 30,
              ),
              child: ButtonBox(
                onPressed: () {
                  Get.toNamed('/profile/coupon/create');
                },
                title: '쿠폰 등록',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
