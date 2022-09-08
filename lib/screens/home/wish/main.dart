import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/models/account.dart';
import 'package:brandu/utils/format.dart';
import 'package:brandu/viewmodels/home/main.dart';
import 'package:brandu/viewmodels/home/wish/main.dart';
import 'package:brandu/widgets/base/border.dart';
import 'package:brandu/widgets/base/snack-bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class WishPage extends GetView<WishController> {
  const WishPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.wishes.isEmpty) {
        return Container(
          width: double.infinity,
          decoration: borderBottom(),
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 40,
            ),
            child: const NotoText(
              '내역이 존재하지 않습니다.',
              size: 12,
              color: mainColor,
            ),
          ),
        );
      }
      return Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.wishes.length,
                itemBuilder: (context, index) {
                  Wish wish = controller.wishes[index];
                  return Container(
                    decoration: borderBottom(),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    fit: BoxFit.scaleDown,
                                    image: NetworkImage(
                                        wish.product.backdrop_image!),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  NotoText(
                                    wish.product.name,
                                    size: 14,
                                    color: greyColor,
                                  ),
                                  const SizedBox(height: 5),
                                  NotoText(
                                    '${currencyFormat.format(wish.product.price)}원',
                                    size: 12,
                                    color: Colors.black,
                                  ),
                                  const SizedBox(height: 30),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                onPressed: () => controller.removeWish(index),
                                icon: SvgPicture.asset(
                                  'assets/icons/close.svg',
                                ),
                              ),
                              const SizedBox(height: 30),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: controller.wishes[index].is_basket
                                      ? mainColor
                                      : lightGreyColor,
                                ),
                                width: 30,
                                height: 30,
                                child: IconButton(
                                  onPressed: () {
                                    if (controller.wishes[index].is_basket) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(CustomSnackBar(
                                        title: '이미 장바구니에 추가되었습니다.',
                                      ));
                                    } else {
                                      controller.addToBasket(index);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        CustomButtonSnackBar(
                                          title: '장바구니에 추가되었습니다!',
                                          buttonTitle: '이동하기',
                                          onPressed: Get.find<HomeController>()
                                              .goBasketPage,
                                        ),
                                      );
                                    }
                                  },
                                  icon: SvgPicture.asset(
                                    'assets/icons/bucket.svg',
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      );
    });
  }
}
