import 'package:brandu/components/color.dart';
import 'package:brandu/components/icon.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/models/account.dart';
import 'package:brandu/utils/format.dart';
import 'package:brandu/viewmodels/profile/info/point/main.dart';
import 'package:brandu/widgets/appbar.dart';
import 'package:brandu/widgets/base/border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePointPage extends GetView<ProfilePointController> {
  const ProfilePointPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        leading: Row(
          children: [
            backIcon(),
            homeIcon(),
          ],
        ),
        title: '포인트',
        actions: const <Widget>[],
      ),
      body: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: borderBottom(),
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        NotoText('보유 포인트', size: 16, color: Colors.black),
                        NotoText('BP란?', size: 12, color: Colors.grey),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    NotoText(
                      '${currencyFormat.format(controller.pointHistory.value.point)} BP',
                      size: 18,
                      color: Colors.black,
                      isBold: true,
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
              child:
                  const NotoText('적립 및 사용 내역', size: 16, color: Colors.black),
            ),
            Container(
              decoration: borderBottom(),
              child: Row(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 25,
                        ),
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller
                              .pointHistory.value.point_history.length,
                          itemBuilder: (context, index) {
                            Point point = controller
                                .pointHistory.value.point_history[index];
                            return Container(
                              margin: const EdgeInsets.symmetric(
                                vertical: 2,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      NotoText(
                                        baseDateFormat.format(point.created),
                                        size: 14,
                                        color: greyColor,
                                      ),
                                      const SizedBox(width: 15),
                                      NotoText(
                                        point.memo,
                                        size: 14,
                                        color: greyColor,
                                      ),
                                    ],
                                  ),
                                  NotoText(
                                    '${point.is_use ? '+' : '-'}${currencyFormat.format(point.point)}',
                                    size: 14,
                                    color:
                                        point.is_use ? Colors.red : mainColor,
                                    isBold: true,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
