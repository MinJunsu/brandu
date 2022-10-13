import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/models/community.dart';
import 'package:brandu/viewmodels/home/community/main.dart';
import 'package:brandu/widgets/container/header-container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CommunityPage extends GetView<CommunityController> {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderContainer(
          description: '이번주 브랜뉴 인기게시글',
          title: 'TOP 10',
          onPressed: () {},
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              spacing: 10,
              children: [
                BestPostContainer(
                  rank: 1,
                  post: SimplePost(
                    id: 1,
                    title: '브랜뉴로 만들어가는 우리 집, 도심속 찬환경 정원 만들기',
                    is_scrap: true,
                  ),
                ),
                BestPostContainer(
                  rank: 1,
                  post: SimplePost(
                    id: 1,
                    title: '브랜뉴로 만들어가는 우리 집, 도심속 찬환경 정원 만들기',
                    is_scrap: true,
                  ),
                ),
                BestPostContainer(
                  rank: 1,
                  post: SimplePost(
                    id: 1,
                    title: '브랜뉴로 만들어가는 우리 집, 도심속 찬환경 정원 만들기',
                    is_scrap: true,
                  ),
                ),
                BestPostContainer(
                  rank: 1,
                  post: SimplePost(
                    id: 1,
                    title: '브랜뉴로 만들어가는 우리 집, 도심속 찬환경 정원 만들기',
                    is_scrap: true,
                  ),
                ),
                BestPostContainer(
                  rank: 1,
                  post: SimplePost(
                    id: 1,
                    title: '브랜뉴로 만들어가는 우리 집, 도심속 찬환경 정원 만들기',
                    is_scrap: true,
                  ),
                ),
                BestPostContainer(
                  rank: 1,
                  post: SimplePost(
                    id: 1,
                    title: '브랜뉴로 만들어가는 우리 집, 도심속 찬환경 정원 만들기',
                    is_scrap: false,
                  ),
                ),
              ],
            ),
          ),
        ),
        HeaderContainer(
          description: '세상 사람들이 브랜뉴를 활용하는 ',
          title: 'BrandUser',
          onPressed: () {},
          child: Container(),
        ),
      ],
    );
  }
}

class BestPostContainer extends StatelessWidget {
  final int rank;
  final SimplePost post;

  const BestPostContainer({
    required this.rank,
    required this.post,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blueGrey,
              // image: DecorationImage(
              //   fit: BoxFit.fitHeight,
              //   image: NetworkImage(post.backdrop_image!),
              // ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: mainColor,
                      ),
                      child: NotoText(
                        rank.toString(),
                        size: 16,
                        isBold: true,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: post.is_scrap ? mainColor : lightGreyColor,
                      ),
                      child: SvgPicture.asset('assets/icons/scrap.svg'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
            ),
            child: NotoText(
              post.title,
              size: 14,
              color: greyColor,
              maxLine: 2,
            ),
          ),
        ],
      ),
    );
  }
}
