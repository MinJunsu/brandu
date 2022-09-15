import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/models/account.dart';
import 'package:brandu/utils/format.dart';
import 'package:brandu/viewmodels/home/basket/main.dart';
import 'package:brandu/viewmodels/order/main.dart';
import 'package:brandu/viewmodels/profile/info/my/main.dart';
import 'package:brandu/widgets/appbar.dart';
import 'package:brandu/widgets/base/box-container.dart';
import 'package:brandu/widgets/base/button.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class OrderPage extends GetView<OrderController> {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        isBack: true,
        title: '주문 및 결제',
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
                          const NotoText('주문내역', size: 16, color: Colors.black),
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
                              Get.find<BasketController>().baskets.length,
                          itemBuilder: (context, index) {
                            Basket basket =
                                Get.find<BasketController>().baskets[index];
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
                                    basket.product.name,
                                    size: 12,
                                    color: greyColor,
                                  ),
                                  NotoText(
                                    '${Get.find<BasketController>().counts[index]}개',
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
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 15,
                      ),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: lightGreyColor,
                            width: 1,
                          ),
                        ),
                      ),
                      child: Wrap(
                        runSpacing: 10,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const NotoText(
                                '주문자',
                                size: 16,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 70,
                                height: 30,
                                child: SmallButtonBox(
                                  title: '수정하기',
                                  onPressed: () => Get.toNamed('/profile/my'),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 60,
                                child: NotoText(
                                  '보내는 분',
                                  size: 14,
                                  color: greyColor,
                                ),
                              ),
                              const SizedBox(width: 20),
                              NotoText(
                                Get.find<ProfileMyController>().name.value,
                                size: 14,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 60,
                                child: NotoText(
                                  '연락처',
                                  size: 14,
                                  color: greyColor,
                                ),
                              ),
                              const SizedBox(width: 20),
                              NotoText(
                                Get.find<ProfileMyController>()
                                    .phoneNumber
                                    .value,
                                size: 14,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 60,
                                child: NotoText(
                                  '이메일',
                                  size: 14,
                                  color: greyColor,
                                ),
                              ),
                              const SizedBox(width: 20),
                              NotoText(
                                Get.find<ProfileMyController>().email.value,
                                size: 14,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    controller.addresses.isNotEmpty
                        ? BadgeAddressBox(
                            selectedIndex: controller.addressIndex,
                            addresses: controller.addresses,
                            onPressed: controller.setAddressIndex,
                          )
                        : Container(),
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
                      const SizedBox(height: 5),
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
                          const NotoText('합계금액', size: 16, color: greyColor),
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
                        onTap: () {},
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

class BadgeAddressBox extends StatelessWidget {
  final List<Address> addresses;
  final int selectedIndex;
  final Function(int) onPressed;

  const BadgeAddressBox({
    Key? key,
    required this.addresses,
    required this.selectedIndex,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 15,
      ),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: lightGreyColor,
            width: 1,
          ),
        ),
      ),
      child: Wrap(
        runSpacing: 10,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const NotoText('배송정보', size: 16, color: Colors.black),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  // child: Container(),
                  child: Wrap(
                    spacing: 5,
                    children: addresses
                        .mapIndexed(
                          (index, element) => GestureDetector(
                            onTap: () => onPressed(index),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 2,
                                horizontal: 5,
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: index == selectedIndex
                                      ? mainColor
                                      : Colors.transparent,
                                  border: Border.all(
                                    color: mainColor,
                                    width: 1,
                                  )),
                              child: NotoText(
                                addresses[index].name,
                                size: 12,
                                color: index == selectedIndex
                                    ? Colors.white
                                    : mainColor,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: 70,
                height: 30,
                child: SmallButtonBox(title: '수정하기', onPressed: () {}),
              )
            ],
          ),
          Row(
            children: [
              const SizedBox(
                width: 60,
                child: NotoText('수령인', size: 14, color: greyColor),
              ),
              const SizedBox(width: 20),
              NotoText(
                addresses[selectedIndex].recipient,
                size: 14,
                color: Colors.black,
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(
                width: 60,
                child: NotoText('연락처', size: 14, color: greyColor),
              ),
              const SizedBox(width: 20),
              NotoText(
                addresses[selectedIndex].phone_number,
                size: 14,
                color: Colors.black,
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(
                width: 60,
                child: NotoText('주소', size: 14, color: greyColor),
              ),
              const SizedBox(width: 20),
              Flexible(
                child: NotoText(
                  addresses[selectedIndex].address,
                  size: 14,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
