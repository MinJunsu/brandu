import 'package:brandu/viewmodels/category/list.dart';
import 'package:brandu/widgets/appbar.dart';
import 'package:brandu/widgets/products/list-box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryListPage extends GetView<CategoryListController> {
  const CategoryListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = Get.arguments[0];
    controller.fetchProducts(Get.arguments[1]);

    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        title: title,
        isBack: true,
        isSearch: false,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 25,
        ),
        child: Column(
          children: [
            Container(
              height: 30,
            ),
            ProductListBox(
              products: controller.products,
            ),
          ],
        ),
      ),
    );
  }
}
