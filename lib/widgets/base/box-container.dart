import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/widgets/appbar.dart';
import 'package:brandu/widgets/base/border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kpostal/kpostal.dart';

class BoxContainer extends StatelessWidget {
  final Widget child;
  final int height;
  final Color color;

  const BoxContainer({
    Key? key,
    required this.child,
    required this.height,
    this.color = lightGreyColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height.toDouble(),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: child,
    );
  }
}

class TitleBox extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final List<Widget> children;

  const TitleBox({
    required this.title,
    required this.onPressed,
    required this.children,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: borderBottom(),
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NotoText(title, size: 16, color: Colors.black),
                GestureDetector(
                  onTap: onPressed,
                  child: const NotoText('전체 보기', size: 12, color: greyColor),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Wrap(
              direction: Axis.vertical,
              spacing: 5,
              children: children,
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileBox extends StatelessWidget {
  final Function() onPressed;
  final String icon;
  final String title;

  const ProfileBox({
    required this.onPressed,
    required this.icon,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: borderBottom(),
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: icon != ''
                    ? [
                        SvgPicture.asset(
                          icon,
                          fit: BoxFit.fitHeight,
                          height: 18,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        NotoText(title, size: 16, color: Colors.black),
                      ]
                    : [
                        NotoText(title, size: 16, color: Colors.black),
                      ],
              ),
              SvgPicture.asset(
                'assets/icons/right-arrow.svg',
                fit: BoxFit.fitHeight,
                height: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InputBox extends StatelessWidget {
  final String title;
  final String initialValue;
  final Function(String?) onSaved;
  final bool enabled;
  final Function()? onTap;

  const InputBox({
    required this.title,
    required this.onSaved,
    required this.initialValue,
    this.enabled = true,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 50,
          child: NotoText(title, size: 14, color: greyColor),
        ),
        const SizedBox(
          width: 30,
        ),
        SizedBox(
          width: 250,
          height: 30,
          child: TextFormField(
            onTap: onTap,
            style: const TextStyle(
              fontFamily: 'Noto Sans KR',
              fontSize: 14,
              height: 1.4,
              letterSpacing: -0.5,
              wordSpacing: -0.5,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.none,
            ),
            readOnly: !enabled,
            enableInteractiveSelection: enabled,
            initialValue: initialValue,
            autovalidateMode: AutovalidateMode.always,
            onSaved: onSaved,
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
        ),
      ],
    );
  }
}

class AddressInputBox extends StatelessWidget {
  final String title;
  final String initialValue;
  final TextEditingController controller;
  final Function(Kpostal) callback;

  const AddressInputBox({
    required this.title,
    required this.initialValue,
    required this.controller,
    required this.callback,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 50,
          child: NotoText(title, size: 14, color: greyColor),
        ),
        const SizedBox(
          width: 30,
        ),
        SizedBox(
          width: 250,
          height: 30,
          child: TextField(
            controller: controller,
            onTap: () async {
              Get.to(
                () => KpostalView(
                  appBar: CustomAppBar(
                    appBar: AppBar(),
                    isBack: true,
                    title: '주소 검색',
                    actions: const <Widget>[],
                  ),
                  callback: callback,
                ),
              );
            },
            style: const TextStyle(
              fontFamily: 'Noto Sans KR',
              fontSize: 14,
              height: 1.4,
              letterSpacing: -0.5,
              wordSpacing: -0.5,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.none,
            ),
            readOnly: true,
            enableInteractiveSelection: false,
            // onSaved: onSaved,
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
        ),
      ],
    );
  }
}
