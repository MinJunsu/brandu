import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/models/account.dart';
import 'package:brandu/utils/format.dart';
import 'package:brandu/viewmodels/home/basket/main.dart';
import 'package:brandu/widgets/base/border.dart';
import 'package:brandu/widgets/base/box-container.dart';
import 'package:brandu/widgets/base/check-box.dart';
import 'package:brandu/widgets/base/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BasketPageViewModel>(
      builder: (viewModel) {
        return Column(
          children: [
            Container(
              decoration: borderBottom(),
              child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 15,
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 25,
                  ),
                  padding: const EdgeInsets.all(10),
                  child: BoxContainer(
                    height: 45,
                    color: lightMainColor,
                    child: Row(
                      children: [
                        CircleCheckBox(
                          isChecked:
                              viewModel.checkedList.every((element) => element),
                          onChanged: viewModel.toggleCheckedList,
                        ),
                        const NotoText(
                          '전체 선택/해제',
                          size: 14,
                          color: Colors.black,
                          isBold: true,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: viewModel.baskets.length,
                  itemBuilder: (context, index) {
                    Basket basket = viewModel.baskets[index];
                    return Container(
                      decoration: borderBottom(),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 25,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    basket.product.backdrop_image!,
                                  ),
                                ),
                              ),
                              child: Container(
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.all(0),
                                child: SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: CircleCheckBox(
                                    isChecked: viewModel.checkedList[index],
                                    onChanged: (checked) {},
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            SizedBox(
                              height: 100,
                              child: Column(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      NotoText(
                                        basket.product.name,
                                        size: 12,
                                        color: greyColor,
                                      ),
                                      Row(
                                        children: [
                                          NotoText(
                                            currencyFormat
                                                .format(basket.product.price),
                                            size: 12,
                                            color: Colors.black,
                                            isBold: true,
                                          ),
                                          const NotoText(
                                            ' 원',
                                            size: 12,
                                            color: Colors.black,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  const Spacer(),
                                  Counter(
                                    count: viewModel.counts[index],
                                    add: () => viewModel.incrementCount(index),
                                    sub: () => viewModel.decrementCount(index),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              height: 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () async {
                                      // bool flag = await AccountsClient()
                                      //     .deleteBucket(widget.bucket.id);
                                    },
                                    icon: SvgPicture.asset(
                                      'assets/icons/close.svg',
                                    ),
                                  ),
                                  const Spacer(),
                                  NotoText(
                                    '${currencyFormat.format(basket.product.price * viewModel.counts[index])} 원',
                                    size: 12,
                                    color: greyColor,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
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
                          const NotoText('주문 금액', size: 12, color: greyColor),
                          NotoText(
                            '${currencyFormat.format(viewModel.orderPrice)}원',
                            size: 12,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          NotoText('배송비', size: 12, color: greyColor),
                          NotoText('3,000원', size: 12, color: Colors.black),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const NotoText('합계금액', size: 14, color: greyColor),
                          NotoText(
                            '${currencyFormat.format(viewModel.orderPrice + 3000)}원',
                            size: 14,
                            color: Colors.black,
                            isBold: true,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          // Get.to(
                          //   () => OrderPage(
                          //     buckets: List<Bucket>.from(
                          //       snapshot.requireData.mapIndexed(
                          //         (index, element) => Bucket(
                          //           id: element.id,
                          //           product: element.product,
                          //           amount: counts[index],
                          //           is_purchase: element.is_purchase,
                          //         ),
                          //       ),
                          //     ),
                          //     sumPrice: orderPrice,
                          //   ),
                          // );
                        },
                        child: BoxContainer(
                          height: 45,
                          color: mainColor,
                          child: Container(
                            alignment: Alignment.center,
                            child: const NotoText(
                              '구매하기',
                              size: 12,
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
        );
      },
    );
  }
}
