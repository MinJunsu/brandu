import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/models/service.dart';
import 'package:brandu/utils/format.dart';
import 'package:brandu/viewmodels/profile/info/service/main-info/main.dart';
import 'package:brandu/widgets/appbar.dart';
import 'package:brandu/widgets/base/border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainInfoPage extends GetView<MainInfoController> {
  const MainInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        isBack: true,
        title: '서비스 주요안내',
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
                  itemCount: controller.mainInfo.value.results.length,
                  itemBuilder: (item, index) {
                    MainInfo mainInfo =
                        controller.mainInfo.value.results[index];
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
                              mainInfo.title,
                              size: 16,
                              color: Colors.black,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            NotoText(
                              baseDateFormat.format(mainInfo.created),
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
