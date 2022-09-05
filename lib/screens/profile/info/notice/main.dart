import 'package:brandu/components/color.dart';
import 'package:brandu/components/icon.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/utils/format.dart';
import 'package:brandu/viewmodels/profile/info/notice/main.dart';
import 'package:brandu/widgets/appbar.dart';
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
              child: ExpansionPanelList(
                children: controller.noticeWithExpanded
                    .map(
                      (notice) => ExpansionPanel(
                        headerBuilder: (context, isExpanded) {
                          return Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 25,
                              vertical: 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                NotoText(
                                  notice.notice.title,
                                  size: 14,
                                  color: Colors.black,
                                  isBold: isExpanded,
                                ),
                                const SizedBox(height: 10),
                                NotoText(
                                  baseDateFormat.format(notice.notice.created),
                                  size: 14,
                                  color: greyColor,
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
                            notice.notice.description,
                            size: 14,
                            color: Colors.black,
                          ),
                        ),
                        isExpanded: notice.expanded,
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
