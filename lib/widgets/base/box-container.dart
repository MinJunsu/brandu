import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/widgets/base/border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
  final List<Widget> children;

  const TitleBox({
    required this.title,
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
                const NotoText('전체 보기', size: 12, color: greyColor),
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
