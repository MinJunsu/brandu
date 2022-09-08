import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Counter extends StatefulWidget {
  final int count;
  final Function() add;
  final Function() sub;

  const Counter({
    Key? key,
    required this.count,
    required this.add,
    required this.sub,
  }) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 85,
      height: 30,
      decoration: BoxDecoration(
        border: Border.all(
          color: mainColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 15,
            height: 15,
            child: GestureDetector(
              onTap: widget.sub,
              child: SvgPicture.asset('assets/icons/minus-green.svg'),
            ),
          ),
          NotoText(
            widget.count.toString().padLeft(2, '0'),
            size: 12,
            color: Colors.black,
          ),
          SizedBox(
            width: 15,
            height: 15,
            child: GestureDetector(
              onTap: widget.add,
              child: SvgPicture.asset('assets/icons/plus-green.svg'),
            ),
          ),
        ],
      ),
    );
  }
}
