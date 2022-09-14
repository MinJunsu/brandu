import 'package:brandu/components/color.dart';
import 'package:brandu/components/icon.dart';
import 'package:brandu/components/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    required this.appBar,
    this.isBack = false,
    this.isSearch = true,
    this.leading,
    this.actions,
    this.title = '',
    Key? key,
  }) : super(key: key);

  final dynamic leading;
  final dynamic actions;
  final bool isBack;
  final bool isSearch;
  final AppBar appBar;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 96,
      leading: leading ?? (isBack ? backIcon() : menuIcon()),
      backgroundColor: mainColor,
      centerTitle: true,
      title: title == ''
          ? SvgPicture.asset(
              'assets/icons/logo.svg',
              fit: BoxFit.fitHeight,
              height: 20,
            )
          : NotoText(
              title,
              size: 16,
              isBold: true,
            ),
      actions:
          actions ?? (isSearch ? [searchIcon(), infoIcon()] : [infoIcon()]),
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
