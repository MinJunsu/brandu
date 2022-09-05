import 'package:brandu/components/color.dart';
import 'package:brandu/components/icon.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/viewmodels/profile/info/service/main.dart';
import 'package:brandu/widgets/appbar.dart';
import 'package:brandu/widgets/base/box-container.dart';
import 'package:brandu/widgets/base/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServicePage extends GetView<ServiceController> {
  const ServicePage({Key? key}) : super(key: key);

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
        title: '고객센터',
        actions: const <Widget>[],
      ),
      body: Column(
        children: [
          /// 검색 화면
          // Container(
          //   decoration: bottomBorder(),
          //   child: Container(
          //     margin: const EdgeInsets.symmetric(
          //       horizontal: 15,
          //       vertical: 20,
          //     ),
          //     child: SearchBox(controller),
          //   ),
          // ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TitleBox(
                    title: '서비스 주요안내',
                    children: controller.services.main_infos
                        .map(
                          (mainInfo) => GestureDetector(
                            onTap: () {
                              // Get.to(() => const MainInfoPage());
                            },
                            child: NotoText(
                              mainInfo.title,
                              size: 14,
                              color: greyColor,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  TitleBox(
                    title: '자주 묻는 질문',
                    children: controller.services.faqs
                        .map(
                          (faq) => GestureDetector(
                            onTap: () {
                              // Get.to(() => const FAQPage());
                            },
                            child: NotoText(
                              faq.title,
                              size: 14,
                              color: greyColor,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  controller.services.inquiries != null
                      ? TitleBox(
                          title: '1:1 문의내역',
                          children: controller.services.inquiries!
                              .map(
                                (inquiry) => GestureDetector(
                                  onTap: () {
                                    // Get.to(() => InquiryAnswerPage(inquiry));
                                  },
                                  child: NotoText(
                                    '${inquiry.is_answer ? "[답변완료]" : "[답변미완료]"} ${inquiry.title}',
                                    size: 14,
                                    color: greyColor,
                                  ),
                                ),
                              )
                              .toList(),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 30,
            ),
            child: ButtonBox(
              title: '1:1 문의하기',
              onPressed: () {
                // Get.to(() => const ServiceInquiryPage());
              },
            ),
          )
        ],
      ),
    );
  }
}
