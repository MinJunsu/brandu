import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/widgets/base/border.dart';
import 'package:brandu/widgets/base/box-container.dart';
import 'package:brandu/widgets/base/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProfileInfoPage extends StatelessWidget {
  const ProfileInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (viewModel) {
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 15,
              ),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: lightGreyColor,
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: lightGreyColor,
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/profile.svg',
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Expanded(
                    child: NotoText(
                      '하늘보리',
                      size: 16,
                      color: Colors.black,
                      isBold: true,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: const NotoText('로그아웃', size: 14, color: greyColor),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 45, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomIconButton(
                    onPressed: () {},
                    icon: 'assets/icons/heart-black.svg',
                    title: '찜한상품',
                    count: 1,
                  ),
                  CustomIconButton(
                    onPressed: () {
                      // Get.to(() => BucketPage());
                    },
                    icon: 'assets/icons/bucket-black.svg',
                    title: '장바구니',
                    count: 2,
                  ),
                  CustomIconButton(
                    onPressed: () {},
                    icon: 'assets/icons/save-black.svg',
                    title: '스크랩북',
                    count: 0,
                  ),
                  CustomIconButton(
                    onPressed: () {
                      // Get.to(() => const CouponPage());
                    },
                    icon: 'assets/icons/coupon.svg',
                    title: '쿠폰',
                    count: 0,
                  ),
                  CustomIconButton(
                    onPressed: () {
                      // Get.to(() => const ProfilePointPage());
                    },
                    icon: 'assets/icons/point.svg',
                    title: '포인트',
                    count: 0,
                  ),
                ],
              ),
            ),
            Container(
              decoration: borderBottom(),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ProfileBox(
                      onPressed: () {
                        // Get.to(() => const ProfileMyPage());
                      },
                      icon: 'assets/icons/profile-edit.svg',
                      title: '개인정보 수정',
                    ),
                    ProfileBox(
                      onPressed: () {
                        // Get.to(() => const NoticePage());
                      },
                      icon: 'assets/icons/announcement.svg',
                      title: '공지사항',
                    ),
                    ProfileBox(
                      onPressed: () {
                        // Get.to(() => const ServiceCenterPage());
                      },
                      icon: 'assets/icons/qna.svg',
                      title: '고객센터',
                    ),
                    ProfileBox(
                      onPressed: () {
                        // Get.to(() => const ProfileNotifyPage());
                      },
                      icon: 'assets/icons/alarm.svg',
                      title: '알림설정',
                    ),
                    ProfileBox(
                      onPressed: () {},
                      icon: '',
                      title: '서비스 이용 약관',
                    ),
                    ProfileBox(
                      onPressed: () {},
                      icon: '',
                      title: '개인정보처리방침',
                    ),
                    ProfileBox(
                      onPressed: () {},
                      icon: '',
                      title: '의견 보내기',
                    ),
                    ProfileBox(
                      onPressed: () {},
                      icon: '',
                      title: '버전',
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
