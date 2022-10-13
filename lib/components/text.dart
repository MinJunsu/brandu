import 'package:flutter/material.dart';

class NotoText extends Text {
  final Color color;
  final int size;
  final bool isBold;
  final int maxLine;

  const NotoText(
    String text, {
    required this.size,
    this.isBold = false,
    this.color = Colors.white,
    this.maxLine = 10,
    Key? key,
  }) : super(key: key, text);

  @override
  TextStyle? get style => TextStyle(
        fontFamily: 'Noto Sans KR',
        color: color,
        fontSize: size.toDouble(),
        height: 1.4,
        letterSpacing: -0.5,
        wordSpacing: -0.5,
        fontWeight: isBold ? FontWeight.w700 : FontWeight.w400,
        decoration: TextDecoration.none,
      );

  @override
  int? get maxLines => maxLine;

  @override
  TextOverflow? get overflow => TextOverflow.ellipsis;
}

const labelStyle = TextStyle(
  fontFamily: 'Noto Sans KR',
  fontSize: 14,
  height: 1.4,
  letterSpacing: -0.5,
  wordSpacing: -0.5,
  fontWeight: FontWeight.w700,
  decoration: TextDecoration.none,
);

const unselectedLabelStyle = TextStyle(
  fontFamily: 'Noto Sans KR',
  fontSize: 14,
  height: 1.4,
  letterSpacing: -0.5,
  wordSpacing: -0.5,
  fontWeight: FontWeight.w400,
  decoration: TextDecoration.none,
);
