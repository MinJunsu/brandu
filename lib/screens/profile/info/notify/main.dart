import 'package:brandu/components/color.dart';
import 'package:brandu/components/icon.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/viewmodels/profile/info/notify/main.dart';
import 'package:brandu/widgets/appbar.dart';
import 'package:brandu/widgets/base/border.dart';
import 'package:brandu/widgets/base/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotifyPage extends GetView<NotifyController> {
  const NotifyPage({Key? key}) : super(key: key);

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
        title: '알림설정',
        actions: const <Widget>[],
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const NotoText('푸시 알림 설정', size: 16, color: Colors.black),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: const [
                      NotoText(
                        '휴대폰 설정 - 알림 - 브랜뉴',
                        size: 14,
                        color: mainColor,
                        isBold: true,
                      ),
                      NotoText('에서 설정 변경', size: 14, color: greyColor),
                    ],
                  )
                ],
              ),
            ),
          ),
          Column(
            children: [
              Container(
                decoration: borderBottom(),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 150,
                        child: NotoText(
                          '스토어 알림',
                          size: 16,
                          color: Colors.black,
                        ),
                      ),
                      ToggleButton(
                        isActive: controller.isStore,
                        setIsActive: controller.setIsStore,
                        onChanged: () {},
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: borderBottom(),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 150,
                        child: NotoText(
                          '커뮤니티 알림',
                          size: 16,
                          color: Colors.black,
                        ),
                      ),
                      ToggleButton(
                        isActive: controller.isCommunity,
                        setIsActive: controller.setIsCommunity,
                        onChanged: () {},
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: borderBottom(),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 150,
                        child: NotoText(
                          '이벤트 및 혜택 알림',
                          size: 16,
                          color: Colors.black,
                        ),
                      ),
                      ToggleButton(
                        isActive: controller.isEvent,
                        setIsActive: controller.setIsEvent,
                        onChanged: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
