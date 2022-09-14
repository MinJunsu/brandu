import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/models/service.dart';
import 'package:brandu/utils/format.dart';
import 'package:brandu/viewmodels/profile/info/service/faq/main.dart';
import 'package:brandu/widgets/appbar.dart';
import 'package:brandu/widgets/base/border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FAQPage extends GetView<FAQController> {
  const FAQPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        isBack: true,
        title: '자주 묻는 질문',
        actions: const <Widget>[],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.faqs.value.results.length,
                  itemBuilder: (item, index) {
                    FAQ faq = controller.faqs.value.results[index];
                    return Container(
                      decoration: borderBottom(),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            NotoText(
                              faq.title,
                              size: 16,
                              color: Colors.black,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            NotoText(
                              baseDateFormat.format(faq.created),
                              size: 14,
                              color: greyColor,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
