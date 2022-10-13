import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:flutter/material.dart';

class HeaderContainer extends StatelessWidget {
  final String description;
  final String title;
  final Function() onPressed;
  final Widget child;

  const HeaderContainer({
    required this.description,
    required this.title,
    required this.onPressed,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 25,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              NotoText(description, size: 12, color: Colors.black),
              const NotoText('전체 보기', size: 12, color: greyColor),
            ],
          ),
          NotoText(title, size: 16, color: Colors.black, isBold: true),
          const SizedBox(height: 20),
          child,
        ],
      ),
    );
  }
}
