import 'package:brandu/components/text.dart';
import 'package:brandu/viewmodels/profile/info/service/main-info/main.dart';
import 'package:brandu/widgets/appbar.dart';
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
              child: ExpansionPanelList(
                children: controller.mainIntoWithExpands
                    .map(
                      (mainInfo) => ExpansionPanel(
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
                                        mainInfo.mainInfo.title,
                                        size: 14,
                                        color: Colors.black,
                                        isBold: true,
                                      )
                                    : NotoText(
                                        mainInfo.mainInfo.title,
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
                            mainInfo.mainInfo.description,
                            size: 14,
                            color: Colors.black,
                          ),
                        ),
                        isExpanded: mainInfo.expanded,
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
