import 'package:brandu/screens/home/main.dart';
import 'package:brandu/viewmodels/home/basket/main.dart';
import 'package:brandu/viewmodels/home/main.dart';
import 'package:brandu/viewmodels/home/store/main.dart';
import 'package:brandu/viewmodels/home/wish/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => StoreController());
    Get.lazyPut(() => BasketController());
    Get.lazyPut(() => WishController());

    return const GetMaterialApp(
      home: HomePage(),
    );
  }
}
