import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/viewmodels/profile/info/service/inquiry/answer.dart';
import 'package:brandu/widgets/appbar.dart';
import 'package:brandu/widgets/base/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InquiryAnswerPage extends GetView<InquiryAnswerController> {
  const InquiryAnswerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        isBack: true,
        title: '1:1 문의하기',
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
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 20,
        ),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NotoText('문의 제목', size: 16, color: Colors.black),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 35,
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
                  decoration: const InputDecoration(
                    hintText: '문의 제목을 작성해주세요',
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
                  initialValue: controller.title,
                  keyboardType: TextInputType.text,
                  onSaved: controller.setTitle,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const NotoText('문의 내용', size: 16, color: Colors.black),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 175,
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
                  maxLines: 10,
                  decoration: const InputDecoration(
                    hintText: '문의 내용을 작성해주세요',
                    contentPadding: EdgeInsets.all(10),
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
                  initialValue: controller.description,
                  keyboardType: TextInputType.multiline,
                  onSaved: controller.setDescription,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 25,
                  right: 25,
                  top: 20,
                ),
                child: ButtonBox(title: '삭제하기', onPressed: controller.onClick),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
