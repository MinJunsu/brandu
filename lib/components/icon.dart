import 'package:brandu/screens/home/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

Widget homeIcon() {
  return Container(
    width: 40,
    alignment: Alignment.centerLeft,
    child: IconButton(
      onPressed: () {
        Get.offAll(() => const HomePage());
      },
      icon: SvgPicture.asset('assets/icons/home.svg'),
    ),
  );
}

Widget backIcon() {
  return Container(
    width: 40,
    alignment: Alignment.centerLeft,
    child: IconButton(
      onPressed: () {
        Get.back();
      },
      icon: SvgPicture.asset('assets/icons/back.svg'),
    ),
  );
}

Widget searchIcon() {
  return Container(
    width: 40,
    alignment: Alignment.centerLeft,
    child: IconButton(
      onPressed: () {
        // Get.to(() => const SearchPage());
      },
      icon: SvgPicture.asset('assets/icons/search.svg'),
    ),
  );
}

Widget infoIcon() {
  return Container(
    width: 40,
    alignment: Alignment.centerLeft,
    child: IconButton(
      onPressed: () {
        // Get.to(() => const ProfilePage());
      },
      icon: SvgPicture.asset('assets/icons/info.svg'),
    ),
  );
}

Widget menuIcon() {
  return Container(
    width: 40,
    alignment: Alignment.centerLeft,
    child: IconButton(
      onPressed: () {
        // Get.to(() => CategoryPage());
      },
      icon: SvgPicture.asset('assets/icons/menu.svg'),
    ),
  );
}
