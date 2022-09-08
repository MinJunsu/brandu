import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/viewmodels/auth/login.dart';
import 'package:brandu/widgets/base/box-container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mainColor,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),
              SvgPicture.asset('assets/icons/logo.svg'),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  NotoText('나를 위한 친환경 브랜딩', size: 18),
                  NotoText('나와 지구를 위한 가치소비 플랫폼', size: 18)
                ],
              ),
              const SizedBox(height: 130),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  NotoText('당신을 위한 친환경', size: 20),
                  NotoText('브랜드, 브랜뉴', size: 20),
                ],
              ),
              const SizedBox(height: 100),
              Wrap(
                runSpacing: 15,
                children: [
                  LoginButton(
                    onPressed: controller.googleLogin,
                    icon: 'assets/icons/google.svg',
                    title: '구글로 로그인',
                  ),
                  LoginButton(
                    onPressed: controller.kakaoLogin,
                    icon: 'assets/icons/kakao.svg',
                    title: '카카오톡으로 로그인',
                  ),
                  LoginButton(
                    onPressed: () {},
                    icon: 'assets/icons/naver.svg',
                    title: '네이버로 로그인',
                  ),
                  LoginButton(
                    onPressed: () {},
                    icon: 'assets/icons/apple.svg',
                    title: 'Apple로 로그인',
                  ),
                ],
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  controller.setIsLoginPass();
                  Get.toNamed('/home');
                },
                child: Container(
                  alignment: Alignment.center,
                  child: const NotoText('로그인 건너뛰기', size: 16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final Function() onPressed;
  final String icon;
  final String title;

  const LoginButton(
      {required this.onPressed,
      required this.icon,
      required this.title,
      Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return BoxContainer(
      height: 46,
      color: Colors.white,
      child: TextButton.icon(
        onPressed: onPressed,
        label: NotoText(title, size: 16, color: Colors.grey),
        icon: SvgPicture.asset(icon),
      ),
    );
  }
}
