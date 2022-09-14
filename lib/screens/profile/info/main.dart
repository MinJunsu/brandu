import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/viewmodels/home/main.dart';
import 'package:brandu/viewmodels/profile/info/main.dart';
import 'package:brandu/viewmodels/profile/info/my/main.dart';
import 'package:brandu/widgets/base/border.dart';
import 'package:brandu/widgets/base/box-container.dart';
import 'package:brandu/widgets/base/button.dart';
import 'package:brandu/widgets/base/snack-bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProfileInfoPage extends GetView<ProfileInfoController> {
  const ProfileInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              Expanded(
                child: Obx(
                  () => NotoText(
                    Get.find<ProfileMyController>().nickname.value,
                    size: 16,
                    color: Colors.black,
                    isBold: true,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    CustomSnackBar(
                      title: '정상적으로 로그아웃 되었습니다.',
                    ),
                  );
                  controller.logout();
                },
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
                onPressed: () {
                  Get.find<HomeController>().goWishPage();
                  Get.toNamed('/home');
                },
                icon: 'assets/icons/heart-black.svg',
                title: '찜한상품',
                count: 1,
              ),
              CustomIconButton(
                onPressed: () {
                  Get.find<HomeController>().goBasketPage();
                  Get.toNamed('/home');
                },
                icon: 'assets/icons/bucket-black.svg',
                title: '장바구니',
                count: 2,
              ),
              CustomIconButton(
                onPressed: () {
                  Get.find<HomeController>().goScrapBook();
                  Get.toNamed('/home');
                },
                icon: 'assets/icons/save-black.svg',
                title: '스크랩북',
                count: 0,
              ),
              CustomIconButton(
                onPressed: () => Get.toNamed('/profile/coupon'),
                icon: 'assets/icons/coupon.svg',
                title: '쿠폰',
                count: 0,
              ),
              CustomIconButton(
                onPressed: () => Get.toNamed('/profile/point'),
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
                  onPressed: () => Get.toNamed('/profile/my'),
                  icon: 'assets/icons/profile-edit.svg',
                  title: '개인정보 수정',
                ),
                ProfileBox(
                  onPressed: () => Get.toNamed('/profile/notice'),
                  icon: 'assets/icons/announcement.svg',
                  title: '공지사항',
                ),
                ProfileBox(
                  onPressed: () => Get.toNamed('/profile/services'),
                  icon: 'assets/icons/qna.svg',
                  title: '고객센터',
                ),
                ProfileBox(
                  onPressed: () => Get.toNamed('/profile/notify'),
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
  }
}
