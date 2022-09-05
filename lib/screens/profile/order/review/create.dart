import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/utils/format.dart';
import 'package:brandu/viewmodels/profile/order/review/create.dart';
import 'package:brandu/widgets/appbar.dart';
import 'package:brandu/widgets/base/border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class ReviewCreatePage extends GetView<ReviewCreateController> {
  const ReviewCreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        isBack: true,
        title: controller.review.is_write ? '리뷰 수정' : '리뷰 쓰기',
        actions: <Widget>[
          TextButton(
            onPressed: controller.onSubmit,
            child: Container(
              margin: const EdgeInsets.only(
                right: 10,
              ),
              alignment: Alignment.center,
              child: const NotoText('저장', size: 16, isBold: true),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            decoration: borderBottom(),
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 20,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                        controller.review.product_name,
                        size: 14,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      NotoText(
                        '구매일: ${baseDateFormat.format(controller.review.payment_day)}',
                        size: 14,
                        color: greyColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 20,
            ),
            child: RatingBar.builder(
              itemSize: 35,
              initialRating: controller.star,
              minRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: controller.setStar,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 20,
            ),
            height: 175,
            child: TextFormField(
              style: const TextStyle(
                fontFamily: 'Noto Sans KR',
                fontSize: 14,
                height: 1.4,
                letterSpacing: -0.5,
                wordSpacing: -0.5,
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.none,
              ),
              maxLines: 10,
              initialValue: controller.description,
              decoration: const InputDecoration(
                hintText: '상세 리뷰를 작성해주세요',
                contentPadding: EdgeInsets.all(10),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  borderSide: BorderSide(width: 1, color: lightGreyColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  borderSide: BorderSide(width: 1, color: lightGreyColor),
                ),
              ),
              keyboardType: TextInputType.multiline,
              onSaved: controller.setDescription,
            ),
          ),
        ],
      ),
    );
  }
}
