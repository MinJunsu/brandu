import 'package:brandu/components/text.dart';
import 'package:brandu/viewmodels/profile/info/service/faq/main.dart';
import 'package:brandu/widgets/appbar.dart';
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
              child: ExpansionPanelList(
                children: controller.faqWithExpands
                    .map(
                      (faq) => ExpansionPanel(
                        headerBuilder: (context, isExpanded) {
                          return Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 25,
                              vertical: 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                isExpanded
                                    ? NotoText(
                                        faq.faq.title,
                                        size: 14,
                                        color: Colors.black,
                                        isBold: true,
                                      )
                                    : NotoText(
                                        faq.faq.title,
                                        size: 14,
                                        color: Colors.black,
                                      ),
                              ],
                            ),
                          );
                        },
                        body: Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 20,
                          ),
                          child: NotoText(
                            faq.faq.description,
                            size: 14,
                            color: Colors.black,
                          ),
                        ),
                        isExpanded: faq.expanded,
                        canTapOnHeader: true,
                      ),
                    )
                    .toList(),
                expansionCallback: controller.setExpanded,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
