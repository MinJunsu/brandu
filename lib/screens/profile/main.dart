import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/viewmodels/profile/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// prefetch profile summary
    controller.fetchProfileSummary();
    return Scaffold(
      body: DefaultTabController(
        length: controller.tabHeaders.length,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.1),
                    blurRadius: 15.0,
                    offset: const Offset(0.0, 0.75),
                  ),
                ],
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    controller: controller.controller,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: mainColor,
                    labelColor: mainColor,
                    unselectedLabelColor: greyColor,
                    labelStyle: labelStyle,
                    unselectedLabelStyle: unselectedLabelStyle,
                    tabs: controller.tabHeaders,
                  ),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: controller.controller,
                children: controller.tabs,
              ),
            )
          ],
        ),
      ),
    );
  }
}
