import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/viewmodels/category/list.dart';
import 'package:brandu/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryListPage extends GetView<CategoryListController> {
  const CategoryListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = Get.arguments[0];
    controller.fetchProducts(Get.arguments[1], Get.arguments[2]);

    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        title: title,
        isBack: true,
        isSearch: false,
      ),
      body: Obx(
        () => controller.isLoading
            ? Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator(),
              )
            : Column(
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
                          isScrollable: true,
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
                  Container(
                    height: 5,
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: controller.controller,
                      children: controller.tabs,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
