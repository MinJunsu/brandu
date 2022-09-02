import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LabelButton extends StatelessWidget {
  final Function() onPressed;
  final String title;
  final String icon;
  final Color color;
  final bool isNetwork;

  const LabelButton({
    required this.onPressed,
    required this.title,
    required this.icon,
    this.color = lightGreyColor,
    this.isNetwork = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color,
          ),
          width: 50,
          height: 50,
          child: isNetwork
              ? SvgPicture.network(
                  icon,
                  fit: BoxFit.scaleDown,
                )
              : SvgPicture.asset(
                  icon,
                  fit: BoxFit.scaleDown,
                ),
        ),
        const SizedBox(
          height: 5,
        ),
        NotoText(title, size: 14, color: color),
      ],
    );
  }
}

class SmallButtonBox extends StatelessWidget {
  final String title;
  final Function() onPressed;

  const SmallButtonBox({Key? key, required this.title, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            color: mainColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: NotoText(title, size: 14, color: mainColor),
      ),
    );
  }
}
