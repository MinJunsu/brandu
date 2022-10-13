import 'package:brandu/components/color.dart';
import 'package:brandu/components/icon.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/viewmodels/home/main.dart';
import 'package:brandu/viewmodels/home/wish/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    required this.appBar,
    this.isBack = false,
    this.isSearch = true,
    this.isBasket = false,
    this.leading,
    this.actions,
    this.title = '',
    Key? key,
  }) : super(key: key);

  final dynamic leading;
  final List<Widget>? actions;
  final bool isBack;
  final bool isSearch;
  final bool isBasket;
  final AppBar appBar;
  final String title;

  List<Widget> getActions() {
    print("!23");
    int index = Get.find<HomeController>().navigatorIndex;
    switch (index) {
      case 0:
        return [basketIcon()];
      case 2:
        return [
          Container(
            alignment: Alignment.centerLeft,
            child: NotoText(
              '총 ${Get.find<WishController>().wishCount}개',
              size: 14,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ];
      default:
        return [];
    }
  }

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
      actions: actions ?? getActions(),
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
