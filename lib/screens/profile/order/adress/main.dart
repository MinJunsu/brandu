import 'package:brandu/components/color.dart';
import 'package:brandu/components/icon.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/models/account.dart';
import 'package:brandu/viewmodels/profile/order/address/main.dart';
import 'package:brandu/widgets/appbar.dart';
import 'package:brandu/widgets/base/border.dart';
import 'package:brandu/widgets/base/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressPage extends GetView<AddressController> {
  const AddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        leading: Row(
          children: [
            backIcon(),
          ],
        ),
        title: '배송지 관리',
        actions: <Widget>[
          TextButton(
            onPressed: () => Get.toNamed('/profile/address/create'),
            child: Container(
              margin: const EdgeInsets.only(
                right: 10,
              ),
              alignment: Alignment.center,
              child: const NotoText('추가', size: 16, isBold: true),
            ),
          ),
        ],
      ),
      body: Obx(
        () => Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    Address address = controller.addresses[index];
                    return AddressBox(
                      address: address,
                      onPressed: () => Get.toNamed(
                        '/profile/address/create',
                        arguments: index,
                      ),
                    );
                  },
                  itemCount: controller.addresses.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddressBox extends StatelessWidget {
  final Address address;
  final Function() onPressed;

  const AddressBox({
    required this.address,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: borderBottom(),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    NotoText(address.name, size: 16, color: Colors.black),
                    const SizedBox(
                      width: 20,
                    ),
                    address.is_main
                        ? Container(
                            width: 32,
                            height: 22,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const NotoText('대표', size: 12, isBold: true),
                          )
                        : Container(),
                  ],
                ),
                SizedBox(
                  width: 70,
                  height: 30,
                  child: SmallButtonBox(
                    title: '수정하기',
                    onPressed: onPressed,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(
                  width: 40,
                  child: NotoText('받는분', size: 14, color: greyColor),
                ),
                const SizedBox(
                  width: 25,
                ),
                NotoText(address.recipient, size: 14, color: Colors.black),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 40,
                  child: NotoText('연락처', size: 14, color: greyColor),
                ),
                const SizedBox(
                  width: 25,
                ),
                NotoText(address.phone_number, size: 14, color: Colors.black),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 40,
                  child: NotoText('주소', size: 14, color: greyColor),
                ),
                const SizedBox(
                  width: 25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NotoText(
                      '[${address.zip_code}] ${address.road_name_address}',
                      size: 14,
                      color: Colors.black,
                    ),
                    NotoText(
                      address.detail_address,
                      size: 14,
                      color: Colors.black,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
