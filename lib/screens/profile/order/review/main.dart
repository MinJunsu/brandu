import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/models/account.dart';
import 'package:brandu/utils/format.dart';
import 'package:brandu/viewmodels/profile/order/review/main.dart';
import 'package:brandu/widgets/appbar.dart';
import 'package:brandu/widgets/base/border.dart';
import 'package:brandu/widgets/base/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class ReviewPage extends GetView<ReviewController> {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        isBack: true,
        title: '리뷰 관리',
        actions: const <Widget>[],
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              child: ToggleButtons(
                constraints: BoxConstraints(
                  minWidth: (MediaQuery.of(context).size.width - 30) / 2,
                  maxWidth: (MediaQuery.of(context).size.width - 30) / 2,
                  minHeight: 40,
                ),
                borderRadius: BorderRadius.circular(10),
                fillColor: mainColor,
                borderColor: mainColor,
                selectedBorderColor: mainColor,
                onPressed: controller.toggleSelect,
                isSelected: controller.isSelected,
                children: [
                  NotoText(
                    '작성가능한 리뷰 (${controller.writable.length})',
                    size: 14,
                    color: controller.isWritable ? Colors.white : mainColor,
                    isBold: true,
                  ),
                  NotoText(
                    '작성한 리뷰 (${controller.wrote.length})',
                    size: 14,
                    color: controller.isWrote ? Colors.white : mainColor,
                    isBold: true,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  Review review = controller.reviews[index];
                  return Container(
                    decoration: borderBottom(),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                color: lightGreyColor,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  NotoText(
                                    review.product_name,
                                    size: 14,
                                    color: Colors.black,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  NotoText(
                                    '구매일: ${baseDateFormat.format(review.payment_day)}',
                                    size: 14,
                                    color: greyColor,
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: RatingBar.builder(
                                      glow: false,
                                      itemSize: 20,
                                      initialRating: review.star.toDouble() / 2,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      ignoreGestures: true,
                                      itemCount: 5,
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {},
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 75,
                            height: 35,
                            child: controller.isWritable
                                ? MainButtonBox(title: '리뷰쓰기', onPressed: () {})
                                : ButtonBox(title: '리뷰 수정', onPressed: () {}),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: controller.reviews.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
