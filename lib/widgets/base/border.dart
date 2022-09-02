import 'package:brandu/components/color.dart';
import 'package:flutter/material.dart';

BoxDecoration borderBottom() {
  return const BoxDecoration(
    border: Border(
      bottom: BorderSide(
        color: lightGreyColor,
        width: 1,
      ),
    ),
  );
}
