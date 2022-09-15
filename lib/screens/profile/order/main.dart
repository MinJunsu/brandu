import 'package:brandu/models/account.dart';
import 'package:brandu/viewmodels/profile/main.dart';
import 'package:brandu/viewmodels/profile/order/main.dart';
import 'package:brandu/widgets/base/border.dart';
import 'package:brandu/widgets/base/box-container.dart';
import 'package:brandu/widgets/base/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileOrderPage extends GetView<ProfileOrderController> {
  const ProfileOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileOrderSummary summary =
        Get.find<ProfileController>().profileSummary.orders;
    return Column(
      children: [
        Container(
          decoration: borderBottom(),
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 45,
              vertical: 25,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIconButton(
                  onPressed: () =>
                      Get.toNamed('/profile/shipping', arguments: 0),
                  icon: 'assets/icons/bill.svg',
                  title: '전체',
                  count: summary.all,
                ),
                CustomIconButton(
                  onPressed: () =>
                      Get.toNamed('/profile/shipping', arguments: 1),
                  icon: 'assets/icons/complete-payment.svg',
                  title: '결제완료',
                  count: summary.paid,
                ),
                CustomIconButton(
                  onPressed: () =>
                      Get.toNamed('/profile/shipping', arguments: 2),
                  icon: 'assets/icons/shipping.svg',
                  title: '배송 중',
                  count: summary.delivery,
                ),
                CustomIconButton(
                  onPressed: () =>
                      Get.toNamed('/profile/shipping', arguments: 3),
                  icon: 'assets/icons/shipping-complete.svg',
                  title: '배송 완료',
                  count: summary.complete,
                ),
                CustomIconButton(
                  onPressed: () =>
                      Get.toNamed('/profile/shipping', arguments: 4),
                  icon: 'assets/icons/confirm.svg',
                  title: '구매확정',
                  count: summary.confirm,
                ),
              ],
            ),
          ),
        ),
        ProfileBox(
          onPressed: () => Get.toNamed('/profile/address'),
          icon: 'assets/icons/map.svg',
          title: '배송지 관리',
        ),
        ProfileBox(
          onPressed: () {},
          icon: 'assets/icons/change.svg',
          title: '취소/교환/환불 내역',
        ),
        ProfileBox(
          onPressed: () => Get.toNamed('/profile/review'),
          icon: 'assets/icons/review.svg',
          title: '리뷰 관리',
        ),
      ],
    );
  }
}
