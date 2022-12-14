import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/models/account.dart';
import 'package:brandu/viewmodels/profile/info/main.dart';
import 'package:brandu/viewmodels/profile/info/my/main.dart';
import 'package:brandu/viewmodels/profile/main.dart';
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
    ProfileMySummary summary = Get.find<ProfileController>().profileSummary.my;
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
                      title: '??????????????? ???????????? ???????????????.',
                    ),
                  );
                  controller.logout();
                },
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: const NotoText('????????????', size: 14, color: greyColor),
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
                  Get.toNamed('/home');
                },
                icon: 'assets/icons/heart-black.svg',
                title: '????????????',
                count: summary.wish,
              ),
              CustomIconButton(
                onPressed: () {
                  Get.toNamed('/basket');
                },
                icon: 'assets/icons/bucket-black.svg',
                title: '????????????',
                count: summary.basket,
              ),
              CustomIconButton(
                onPressed: () {
                  Get.toNamed('/home');
                },
                icon: 'assets/icons/save-black.svg',
                title: '????????????',
                count: summary.basket,
              ),
              CustomIconButton(
                onPressed: () => Get.toNamed('/profile/coupon'),
                icon: 'assets/icons/coupon.svg',
                title: '??????',
                count: summary.coupon,
              ),
              CustomIconButton(
                onPressed: () => Get.toNamed('/profile/point'),
                icon: 'assets/icons/point.svg',
                title: '?????????',
                count: summary.point,
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
                  title: '???????????? ??????',
                ),
                ProfileBox(
                  onPressed: () => Get.toNamed('/profile/notice'),
                  icon: 'assets/icons/announcement.svg',
                  title: '????????????',
                ),
                ProfileBox(
                  onPressed: () => Get.toNamed('/profile/services'),
                  icon: 'assets/icons/qna.svg',
                  title: '????????????',
                ),
                ProfileBox(
                  onPressed: () => Get.toNamed('/profile/notify'),
                  icon: 'assets/icons/alarm.svg',
                  title: '????????????',
                ),
                ProfileBox(
                  onPressed: () {},
                  icon: '',
                  title: '????????? ?????? ??????',
                ),
                ProfileBox(
                  onPressed: () {},
                  icon: '',
                  title: '????????????????????????',
                ),
                ProfileBox(
                  onPressed: () {},
                  icon: '',
                  title: '?????? ?????????',
                ),
                ProfileBox(
                  onPressed: () {},
                  icon: '',
                  title: '??????',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
