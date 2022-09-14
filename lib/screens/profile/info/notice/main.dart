import 'package:brandu/components/color.dart';
import 'package:brandu/components/icon.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/models/service.dart';
import 'package:brandu/utils/format.dart';
import 'package:brandu/viewmodels/profile/info/notice/main.dart';
import 'package:brandu/widgets/appbar.dart';
import 'package:brandu/widgets/base/border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoticePage extends GetView<NoticeController> {
  const NoticePage({Key? key}) : super(key: key);

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
        title: '공지 사항',
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
                  itemCount: controller.notices.length,
                  itemBuilder: (item, index) {
                    Notice notice = controller.notices[index];
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
                              notice.title,
                              size: 16,
                              color: Colors.black,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            NotoText(
                              baseDateFormat.format(notice.created),
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
