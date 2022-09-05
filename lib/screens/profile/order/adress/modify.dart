import 'package:brandu/components/text.dart';
import 'package:brandu/screens/profile/info/my/main.dart';
import 'package:brandu/viewmodels/profile/order/address/modify.dart';
import 'package:brandu/widgets/appbar.dart';
import 'package:brandu/widgets/base/check-box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressModifyPage extends GetView<AddressModifyController> {
  const AddressModifyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isBack: true,
        appBar: AppBar(),
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
          child: Wrap(
            direction: Axis.vertical,
            spacing: 10,
            children: [
              InputBox(
                title: '주소명',
                onSaved: controller.setName,
                initialValue: controller.name,
              ),
              InputBox(
                title: '받는분',
                onSaved: controller.setRecipient,
                initialValue: controller.recipient,
              ),
              InputBox(
                title: '연락처',
                onSaved: controller.setPhoneNumber,
                initialValue: controller.phoneNumber,
              ),
              InputBox(
                title: '주소',
                onSaved: controller.setRoadAddress,
                initialValue: controller.roadAddress,
              ),
              InputBox(
                title: '상세주소',
                onSaved: controller.setDetailAddress,
                initialValue: controller.detailAddress,
              ),
              Row(
                children: [
                  CircleCheckBox(
                    isChecked: controller.isMain,
                    onChanged: controller.setIsMain,
                  ),
                  const NotoText('대표 배송지로 선택', size: 16, color: Colors.black),
                ],
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}
