import 'package:brandu/components/color.dart';
import 'package:brandu/components/icon.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/viewmodels/profile/info/my/main.dart';
import 'package:brandu/widgets/appbar.dart';
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
                                  initialValue: controller.nickname,
                                ),
                                InputBox(
                                  title: '이름',
                                  onSaved: controller.setName,
                                  initialValue: controller.name,
                                ),
                                InputBox(
                                  title: '연락처',
                                  onSaved: controller.setPhoneNumber,
                                  initialValue: controller.phoneNumber,
                                ),
                                InputBox(
                                  title: '이메일',
                                  onSaved: controller.setEmail,
                                  initialValue: controller.email,
                                ),
                                InputBox(
                                  title: 'SNS',
                                  onSaved: controller.setSnsLink,
                                  initialValue: controller.snsLink,
                                ),
                                InputBox(
                                  title: '소개',
                                  onSaved: controller.setDescription,
                                  initialValue: controller.description,
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

class InputBox extends StatefulWidget {
  final String title;
  final String initialValue;
  final Function(String?) onSaved;

  // final String? Function(String?) validator;

  const InputBox({
    required this.title,
    required this.onSaved,
    required this.initialValue,
    Key? key,
  }) : super(key: key);

  @override
  State<InputBox> createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 50,
          child: NotoText(widget.title, size: 14, color: greyColor),
        ),
        const SizedBox(
          width: 30,
        ),
        SizedBox(
          width: 250,
          height: 30,
          child: TextFormField(
            style: const TextStyle(
              fontFamily: 'Noto Sans KR',
              fontSize: 14,
              height: 1.4,
              letterSpacing: -0.5,
              wordSpacing: -0.5,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.none,
            ),
            initialValue: widget.initialValue,
            autovalidateMode: AutovalidateMode.always,
            onSaved: widget.onSaved,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide: BorderSide(width: 1, color: lightGreyColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide: BorderSide(width: 1, color: lightGreyColor),
              ),
            ),
            keyboardType: TextInputType.text,
          ),
        )
      ],
    );
  }
}
