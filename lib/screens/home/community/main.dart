import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/viewmodels/home/community/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommunityPage extends GetView<CommunityController> {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          child: Row(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: Wrap(
                      spacing: 10,
                      children: [],
                      //   children: userStories
                      //       .map(
                      //         (userStory) => userCircleIcon(userStory),
                      //       )
                      //       .toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          margin: const EdgeInsets.symmetric(
            vertical: 5,
          ),
          color: Colors.white,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  NotoText(
                    '오늘의 인기 게시글',
                    size: 16,
                    color: Colors.black,
                    isBold: true,
                  ),
                  NotoText('전체보기', size: 12, color: lightGreyColor),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Container(),
                        // child: Wrap(
                        //   spacing: 15,
                        //   children: posts
                        //       .map(
                        //         (post) => bestPost(post),
                        //       )
                        //       .toList(),
                        // ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          margin: const EdgeInsets.symmetric(
            vertical: 5,
          ),
          color: Colors.white,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  SizedBox(),
                  NotoText('시간순 ', size: 10, color: lightGreyColor),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
