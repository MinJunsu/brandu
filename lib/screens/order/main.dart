import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/models/account.dart';
import 'package:brandu/utils/format.dart';
import 'package:brandu/viewmodels/home/basket/main.dart';
import 'package:brandu/viewmodels/order/main.dart';
import 'package:brandu/widgets/base/box-container.dart';
import 'package:brandu/widgets/base/button.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderPageViewModel>(
      builder: (viewModel) {
        return Column(
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
                      onTap: viewModel.toggleVisibility,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const NotoText('주문내역', size: 16, color: Colors.black),
                          Container(
                            child: viewModel.visibility
                                ? SvgPicture.asset('assets/icons/up-arrow.svg')
                                : SvgPicture.asset(
                                    'assets/icons/down-arrow.svg'),
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      maintainSize: false,
                      visible: viewModel.visibility,
                      child: Container(
                        margin: const EdgeInsets.only(
                          top: 15,
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          // itemCount: buckets.length,
                          itemBuilder: (context, index) {
                            dynamic basket = null;
                            // Basket basket =
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
                                    '${basket.amount}개',
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
                              const NotoText('주문자',
                                  size: 16, color: Colors.black),
                              SizedBox(
                                width: 70,
                                height: 30,
                                child: SmallButtonBox(
                                    title: '수정하기', onPressed: () {}),
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              SizedBox(
                                width: 60,
                                child: NotoText(
                                  '보내는 분',
                                  size: 14,
                                  color: greyColor,
                                ),
                              ),
                              SizedBox(width: 20),
                              NotoText('userName',
                                  size: 14, color: Colors.black),
                            ],
                          ),
                          Row(
                            children: const [
                              SizedBox(
                                width: 60,
                                child:
                                    NotoText('연락처', size: 14, color: greyColor),
                              ),
                              SizedBox(width: 20),
                              NotoText('phoneNumber',
                                  size: 14, color: Colors.black),
                            ],
                          ),
                          Row(
                            children: const [
                              SizedBox(
                                width: 60,
                                child:
                                    NotoText('이메일', size: 14, color: greyColor),
                              ),
                              SizedBox(width: 20),
                              NotoText('email', size: 14, color: Colors.black),
                            ],
                          ),
                        ],
                      ),
                    ),
                    BadgeAddressBox(
                      index: viewModel.addressIndex,
                      addresses: viewModel.addresses,
                      onPressed: viewModel.setAddressIndex,
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
                            '${currencyFormat.format(Get.find<BasketPageViewModel>().orderPrice)}원',
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
                            '${currencyFormat.format(Get.find<BasketPageViewModel>().orderPrice + 3000)}원',
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
                            child:
                                const NotoText('결제하기', size: 14, isBold: true),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class BadgeAddressBox extends StatefulWidget {
  final List<Address> addresses;
  final int index;
  final dynamic onPressed;

  const BadgeAddressBox({
    Key? key,
    required this.addresses,
    required this.index,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<BadgeAddressBox> createState() => _BadgeAddressBoxState();
}

class _BadgeAddressBoxState extends State<BadgeAddressBox> {
  @override
  Widget build(BuildContext context) {
    if (widget.addresses.isEmpty) {
      return const SizedBox(
        height: 150,
      );
    }
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
                  scrollDirection: Axis.horizontal,
                  child: Wrap(
                    spacing: 5,
                    direction: Axis.horizontal,
                    children: <Widget>[
                      ...widget.addresses
                          .mapIndexed(
                            (idx, address) => GestureDetector(
                              onTap: () => widget.onPressed(idx),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 2,
                                  horizontal: 5,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: idx == widget.index
                                        ? mainColor
                                        : Colors.transparent,
                                    border: Border.all(
                                      color: mainColor,
                                      width: 1,
                                    )),
                                child: NotoText(
                                  address.name,
                                  size: 12,
                                  color: idx == widget.index
                                      ? Colors.white
                                      : mainColor,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ],
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
              const NotoText('수령인', size: 14, color: greyColor),
              const SizedBox(width: 20),
              NotoText(
                widget.addresses[widget.index].recipient,
                size: 12,
                color: Colors.black,
              ),
            ],
          ),
          Row(
            children: [
              const NotoText('연락처', size: 12, color: greyColor),
              const SizedBox(width: 20),
              NotoText(
                widget.addresses[widget.index].phone_number,
                size: 12,
                color: Colors.black,
              ),
            ],
          ),
          Row(
            children: [
              const NotoText('주소', size: 12, color: greyColor),
              const SizedBox(width: 33),
              Flexible(
                child: NotoText(
                  widget.addresses[widget.index].address,
                  size: 12,
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
