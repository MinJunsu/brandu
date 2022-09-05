import 'package:brandu/widgets/base/border.dart';
import 'package:brandu/widgets/base/box-container.dart';
import 'package:brandu/widgets/base/button.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  onPressed: () {},
                  icon: 'assets/icons/bill.svg',
                  title: '전체',
                  count: 1,
                ),
                CustomIconButton(
                  onPressed: () {},
                  icon: 'assets/icons/complete-payment.svg',
                  title: '결제완료',
                  count: 1,
                ),
                CustomIconButton(
                  onPressed: () {},
                  icon: 'assets/icons/shipping.svg',
                  title: '배송 중',
                  count: 0,
                ),
                CustomIconButton(
                  onPressed: () {},
                  icon: 'assets/icons/shipping-complete.svg',
                  title: '배송 완료',
                  count: 0,
                ),
                CustomIconButton(
                  onPressed: () {},
                  icon: 'assets/icons/confirm.svg',
                  title: '구매확정',
                  count: 0,
                ),
              ],
            ),
          ),
        ),
        ProfileBox(
          onPressed: () {},
          icon: 'assets/icons/map.svg',
          title: '배송지 관리',
        ),
        ProfileBox(
          onPressed: () {},
          icon: 'assets/icons/change.svg',
          title: '취소/교환/환불 내역',
        ),
        ProfileBox(
          onPressed: () {},
          icon: 'assets/icons/review.svg',
          title: '리뷰 관리',
        ),
      ],
    );
  }
}
