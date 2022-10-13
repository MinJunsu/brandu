import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/models/product.dart';
import 'package:brandu/viewmodels/category/main.dart';
import 'package:brandu/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryPage extends GetView<CategoryController> {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        isBack: true,
        title: '카테고리',
      ),
      body: Obx(
        () => Row(
          children: [
            Container(
              width: 110,
              color: Colors.white,
              height: double.infinity,
              child: ListView.builder(
                itemCount: controller.mainCategories.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => controller.selectPage(index),
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 30,
                      ),
                      color: index == controller.index
                          ? lightMainColor
                          : Colors.white,
                      child: NotoText(
                        controller.mainCategories[index].name,
                        size: 14,
                        isBold: index == controller.index,
                        color: Colors.black,
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              margin: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width - 130,
              child: GridView.builder(
                itemCount: controller
                    .mainCategories[controller.index].sub_categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.2,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (BuildContext context, int index) {
                  SubCategory category = controller
                      .mainCategories[controller.index].sub_categories[index];
                  return GestureDetector(
                    onTap: () => Get.toNamed(
                      '/category/list',
                      arguments: [
                        controller.mainCategories[controller.index].name,
                        controller.mainCategories[controller.index].id,
                        index,
                      ],
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black12
                                // image: DecorationImage(
                                //   fit: BoxFit.cover,
                                //   image: NetworkImage(category.backdrop_image!),
                                // ),
                                ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          NotoText(category.name, size: 14, color: greyColor),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
