import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/viewmodels/profile/info/coupon/create.dart';
import 'package:brandu/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CouponCreatePage extends GetView<CouponCreateController> {
  const CouponCreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        isBack: true,
        actions: const <Widget>[],
        title: '쿠폰등록',
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 35,
              child: TextField(
                cursorHeight: 0,
                cursorWidth: 0,
                cursorColor: mainColor,
                controller: controller.controller,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  hintText: '쿠폰 번호를 입력해주세요.',
                  hintStyle: TextStyle(
                    color: greyColor,
                    fontSize: 14,
                  ),
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
                keyboardType: TextInputType.text,
                onSubmitted: controller.registerCoupon,
              ),
            ),
            const SizedBox(height: 5),
            const NotoText(
              '이미 사용되었거나, 잘못된 쿠폰 번호 입니다.',
              size: 14,
              color: Colors.red,
            ),
            const SizedBox(height: 10),
            Container(
              height: 40,
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: mainColor,
              ),
              child: TextButton(
                onPressed: () {},
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: const NotoText('쿠폰 등록', size: 14, isBold: true),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
