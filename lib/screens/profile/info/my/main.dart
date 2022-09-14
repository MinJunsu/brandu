import 'package:brandu/components/color.dart';
import 'package:brandu/components/icon.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/viewmodels/profile/info/my/main.dart';
import 'package:brandu/widgets/appbar.dart';
import 'package:brandu/widgets/base/box-container.dart';
import 'package:brandu/widgets/base/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileMyPage extends GetView<ProfileMyController> {
  const ProfileMyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        leading: Row(
          children: [
            backIcon(),
            homeIcon(),
          ],
        ),
        title: '개인정보 수정',
        actions: <Widget>[
          TextButton(
            onPressed: controller.onSubmit,
            child: Container(
              margin: const EdgeInsets.only(
                right: 10,
              ),
              alignment: Alignment.center,
              child: const NotoText('저장', size: 16, isBold: true),
            ),
          ),
        ],
      ),
      body: SizedBox(
        height: double.infinity,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: const BoxDecoration(
                color: lightGreyColor,
              ),
              child: ModifyButton(
                onPressed: () {},
              ),
            ),
            Positioned(
              top: 150,
              child: Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ModifyButton(
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            Positioned(
              top: 200,
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 20,
                ),
                child: SizedBox(
                  height: 500,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const NotoText('회원정보', size: 16, color: Colors.black),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Form(
                            key: controller.formKey,
                            child: Wrap(
                              direction: Axis.vertical,
                              spacing: 10,
                              children: [
                                InputBox(
                                  title: '닉네임',
                                  onSaved: controller.setNickname,
                                  initialValue: controller.nickname.value,
                                ),
                                InputBox(
                                  title: '이름',
                                  onSaved: controller.setName,
                                  initialValue: controller.name.value,
                                ),
                                InputBox(
                                  title: '연락처',
                                  onSaved: controller.setPhoneNumber,
                                  initialValue: controller.phoneNumber.value,
                                ),
                                InputBox(
                                  title: '이메일',
                                  onSaved: controller.setEmail,
                                  initialValue: controller.email.value,
                                ),
                                InputBox(
                                  title: 'SNS',
                                  onSaved: controller.setSnsLink,
                                  initialValue: controller.snsLink.value,
                                ),
                                InputBox(
                                  title: '소개',
                                  onSaved: controller.setDescription,
                                  initialValue: controller.description.value,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
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
