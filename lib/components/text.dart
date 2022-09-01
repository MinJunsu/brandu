import 'package:flutter/material.dart';

class NotoText extends Text {
  final Color color;
  final int size;
  final bool isBold;
  const NotoText(String text, {required this.size, this.isBold = false, this.color = Colors.white, Key? key,}) : super(key: key, text);

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
}