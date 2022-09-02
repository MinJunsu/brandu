import 'package:brandu/components/color.dart';
import 'package:flutter/material.dart';

class CircleCheckBox extends StatelessWidget {
  final bool isChecked;
  final void Function(bool?) onChanged;

  const CircleCheckBox({
    required this.isChecked,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      splashRadius: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      activeColor: mainColor,
      value: isChecked,
      onChanged: onChanged,
    );
  }
}
