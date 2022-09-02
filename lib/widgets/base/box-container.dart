import 'package:brandu/components/color.dart';
import 'package:flutter/material.dart';

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
