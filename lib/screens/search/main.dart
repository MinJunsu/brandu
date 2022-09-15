import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/models/search.dart';
import 'package:brandu/viewmodels/search/main.dart';
import 'package:brandu/widgets/appbar.dart';
import 'package:brandu/widgets/base/border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends GetView<SearchController> {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        isSearch: false,
        title: '검색',
      ),
      body: Obx(
            () =>
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchBox(controller: controller.controller),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: const NotoText(
                        '최근 검색어',
                        size: 16,
                        color: Colors.black,
                        isBold: true,
                      ),
                    ),
                    Container(
                      decoration: borderBottom(),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 5,
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: controller.recentSearches.isNotEmpty
                              ? Wrap(
                            direction: Axis.horizontal,
                            spacing: 10,
                            children: controller.recentSearches
                                .map(
                                  (recentSearch) =>
                                  TagBox(
                                    id: recentSearch.id,
                                    title: recentSearch.search_word,
                                  ),
                            )
                                .toList(),
                          )
                              : Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            alignment: Alignment.center,
                            width: (MediaQuery
                                .of(context)
                                .size
                                .width - 30),
                            height: 50,
                            child: const NotoText(
                              '최근 검색어가 없습니다.',
                              size: 14,
                              color: mainColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 35,
                        vertical: 10,
                      ),
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.searchRanks.length,
                        itemBuilder: (context, index) {
                          SearchRank searchRank = controller.searchRanks[index];
                          return Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 5,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    NotoText(
                                      (index + 1).toString(),
                                      size: 16,
                                      color: mainColor,
                                      isBold: true,
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    NotoText(
                                      searchRank.search_word,
                                      size: 16,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 1,
                                  color: lightGreyColor,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
      ),
    );
  }
}

class SearchBox extends StatelessWidget {
  final TextEditingController controller;

  const SearchBox({
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: borderBottom(),
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 40,
                child: TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    hintText: '검색어를 입력해주세요',
                    hintStyle: TextStyle(
                      color: greyColor,
                      fontSize: 14,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide(width: 1, color: mainColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide(width: 1, color: mainColor),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                child: const NotoText('취소', size: 16, color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TagBox extends StatelessWidget {
  final int id;
  final String title;

  const TagBox({Key? key, required this.title, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: mainColor,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: NotoText(title, size: 14, color: mainColor),
    );
  }
}
