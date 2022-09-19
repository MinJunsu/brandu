import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/models/event.dart';
import 'package:brandu/utils/format.dart';
import 'package:brandu/viewmodels/home/basket/main.dart';
import 'package:brandu/viewmodels/order/payment/main.dart';
import 'package:brandu/viewmodels/profile/info/coupon/main.dart';
import 'package:brandu/viewmodels/profile/main.dart';
import 'package:brandu/widgets/appbar.dart';
import 'package:brandu/widgets/base/border.dart';
import 'package:brandu/widgets/base/box-container.dart';
import 'package:brandu/widgets/base/button.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class PaymentPage extends GetView<PaymentController> {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        isBack: true,
        title: '주문 및 결제',
        actions: const <Widget>[],
      ),
      body: Obx(
        () => Column(
          children: [
            Container(
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
                margin: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: controller.toggleVisibility,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const NotoText('쿠폰', size: 16, color: Colors.black),
                          Container(
                            child: controller.visibility
                                ? SvgPicture.asset('assets/icons/up-arrow.svg')
                                : SvgPicture.asset(
                                    'assets/icons/down-arrow.svg'),
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      maintainSize: false,
                      visible: controller.visibility,
                      child: Container(
                        margin: const EdgeInsets.only(
                          top: 15,
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount:
                              Get.find<CouponController>().coupons.length,
                          itemBuilder: (context, index) {
                            CouponHold coupon =
                                Get.find<CouponController>().coupons[index];
                            return Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  NotoText(
                                    coupon.coupon.name,
                                    size: 12,
                                    color: greyColor,
                                  ),
                                  NotoText(
                                    '${coupon.coupon}개',
                                    size: 12,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      decoration: borderBottom(),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 25,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const NotoText('포인트',
                                size: 16, color: Colors.black),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                // TextField(),
                                SizedBox(
                                  width: 90,
                                  height: 40,
                                  child: MainSmallButtonBox(
                                      title: '전액사용', onPressed: () {}),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const NotoText(
                                  '사용 가능한 포인트',
                                  size: 14,
                                  color: greyColor,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                NotoText(
                                  '${currencyFormat.format(Get.find<ProfileController>().profileSummary.my.point)} BP',
                                  size: 14,
                                  color: mainColor,
                                  isBold: true,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: borderBottom(),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 25,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const NotoText('결제수단',
                                size: 16, color: Colors.black),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Wrap(
                                      direction: Axis.horizontal,
                                      spacing: 10,
                                      children: controller.payments
                                          .mapIndexed(
                                            (index, element) => PaymentIcon(
                                                title: element,
                                                onPressed: () => controller
                                                    .selectIndex(index),
                                                isChecked: index ==
                                                    controller.selectedIndex),
                                          )
                                          .toList(),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                  ),
                ],
                color: Colors.white,
              ),
              child: Container(
                margin: const EdgeInsets.only(
                  top: 20,
                  bottom: 20,
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 65,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const NotoText('주문 금액', size: 14, color: greyColor),
                          NotoText(
                            '${currencyFormat.format(Get.find<BasketController>().orderPrice)}원',
                            size: 14,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          NotoText('배송비', size: 14, color: greyColor),
                          NotoText('3,000원', size: 14, color: Colors.black),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const NotoText('쿠폰 사용', size: 14, color: greyColor),
                          NotoText(
                            '${0}원',
                            size: 14,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          NotoText('포인트 사용', size: 14, color: greyColor),
                          NotoText('3,000원', size: 14, color: Colors.black),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const NotoText('최총 결제 금액',
                              size: 16, color: greyColor),
                          NotoText(
                            '${currencyFormat.format(Get.find<BasketController>().orderPrice + 3000)}원',
                            size: 16,
                            color: Colors.black,
                            isBold: true,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () => Get.toNamed('/order/payment/loading'),
                        child: BoxContainer(
                          height: 45,
                          color: mainColor,
                          child: Container(
                            alignment: Alignment.center,
                            child: const NotoText(
                              '결제하기',
                              size: 14,
                              isBold: true,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentIcon extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final bool isChecked;

  const PaymentIcon({
    required this.title,
    required this.onPressed,
    required this.isChecked,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black12,
              border: Border.all(
                color: isChecked ? mainColor : Colors.black12,
                width: isChecked ? 2 : 0,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          NotoText(
            title,
            size: 12,
            color: isChecked ? mainColor : Colors.black,
            isBold: isChecked,
          ),
        ],
      ),
    );
  }
}
