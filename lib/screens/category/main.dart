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
      body: Container(
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: controller.mainCategories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1 / 1.3,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (BuildContext context, int index) {
            MainCategory category = controller.mainCategories[index];
            return Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(category.backdrop_image!),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  NotoText(category.name, size: 14, color: greyColor),
                  NotoText(
                    category.name,
                    size: 14,
                    color: Colors.black,
                    isBold: true,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
