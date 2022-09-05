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

class CustomIconButton extends StatelessWidget {
  final Function() onPressed;
  final String icon;
  final String title;
  final int count;

  const CustomIconButton({
    required this.onPressed,
    required this.icon,
    required this.title,
    this.count = 0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          SvgPicture.asset(
            icon,
            fit: BoxFit.fitHeight,
            height: 18,
          ),
          const SizedBox(
            height: 3,
          ),
          NotoText(
            title,
            size: 12,
            color: greyColor,
          ),
          const SizedBox(
            height: 5,
          ),
          NotoText(
            count.toString(),
            size: 12,
            color: Colors.black,
            isBold: true,
          ),
        ],
      ),
    );
  }
}

class ButtonBox extends StatelessWidget {
  final String title;
  final dynamic onPressed;

  const ButtonBox({
    required this.onPressed,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: mainColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          child: NotoText(
            title,
            size: 14,
            color: mainColor,
            isBold: true,
          ),
        ),
      ),
    );
  }
}

class ModifyButton extends StatelessWidget {
  final dynamic onPressed;

  const ModifyButton({
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        alignment: Alignment.bottomRight,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: mainColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          width: 32,
          height: 22,
          child: const NotoText(
            '수정',
            size: 12,
            color: mainColor,
            isBold: true,
          ),
        ),
      ),
    );
  }
}

class ToggleButton extends StatelessWidget {
  final bool isActive;
  final Function(bool?) setIsActive;
  final Function()? onChanged;

  const ToggleButton({
    required this.isActive,
    required this.setIsActive,
    this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: isActive ? mainColor : greyColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(30),
        color: isActive ? lightMainColor : lightGreyColor,
      ),
      width: 56,
      height: 30,
      child: Transform.scale(
        scale: 1.2,
        child: Switch(
          inactiveTrackColor: Colors.transparent,
          activeTrackColor: Colors.transparent,
          inactiveThumbColor: greyColor,
          activeColor: mainColor,
          value: isActive,
          onChanged: (value) {
            setIsActive(value);
            if (onChanged != null) {
              onChanged!();
            }
          },
        ),
      ),
    );
  }
}

class MainButtonBox extends StatelessWidget {
  final String title;
  final dynamic onPressed;

  const MainButtonBox({required this.title, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          child: NotoText(title, size: 14, isBold: true),
        ),
      ),
    );
  }
}
