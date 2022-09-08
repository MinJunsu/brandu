import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:flutter/material.dart';

class ButtonSnackBarContent extends StatelessWidget {
  final String title;
  final String buttonTitle;
  final Function() onPressed;

  const ButtonSnackBarContent({
    required this.title,
    required this.buttonTitle,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        NotoText(title, size: 14, color: Colors.black),
        GestureDetector(
          onTap: onPressed,
          child: Container(
            alignment: Alignment.center,
            width: 80,
            height: 36,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: mainColor,
            ),
            child: NotoText(buttonTitle, size: 14),
          ),
        ),
      ],
    );
  }
}

class CustomButtonSnackBar extends SnackBar {
  final String title;
  final String buttonTitle;
  final Function() onPressed;

  CustomButtonSnackBar({
    required this.title,
    required this.buttonTitle,
    required this.onPressed,
    Key? key,
  }) : super(
          content: ButtonSnackBarContent(
            title: title,
            buttonTitle: buttonTitle,
            onPressed: onPressed,
          ),
          key: key,
        );

  @override
  Color? get backgroundColor => Colors.white;

  @override
  SnackBarBehavior? get behavior => SnackBarBehavior.floating;

  @override
  EdgeInsetsGeometry? get padding => const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 20,
      );

  @override
  ShapeBorder? get shape => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      );
}

class SnackBarContent extends StatelessWidget {
  final String title;

  const SnackBarContent({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotoText(title, size: 14, color: Colors.black);
  }
}

class CustomSnackBar extends SnackBar {
  final String title;

  CustomSnackBar({
    required this.title,
    Key? key,
  }) : super(content: SnackBarContent(title: title), key: key);

  @override
  Color? get backgroundColor => Colors.white;

  @override
  SnackBarBehavior? get behavior => SnackBarBehavior.floating;

  @override
  EdgeInsetsGeometry? get padding => const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 20,
      );

  @override
  ShapeBorder? get shape => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      );
}
