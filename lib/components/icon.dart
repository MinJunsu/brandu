import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

Widget homeIcon() {
  return Container(
    width: 40,
    alignment: Alignment.centerLeft,
    child: IconButton(
      onPressed: () {
        Get.offAllNamed('/home');
        // Get.offAll(() => const HomePage());
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
        Get.toNamed('/search');
      },
      icon: SvgPicture.asset('assets/icons/search.svg'),
    ),
  );
}

Widget infoIcon() {
  const FlutterSecureStorage storage = FlutterSecureStorage();
  return Container(
    width: 40,
    alignment: Alignment.centerLeft,
    child: IconButton(
      onPressed: () async {
        if (await storage.read(key: 'ACCESS_TOKEN') != null) {
          Get.toNamed('/profile');
        } else {
          Get.toNamed('login');
        }
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
