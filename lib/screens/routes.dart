import 'package:brandu/bindings/home.dart';
import 'package:brandu/bindings/profile.dart';
import 'package:brandu/screens/auth/login.dart';
import 'package:brandu/screens/order/main.dart';
import 'package:brandu/screens/profile/info/coupon/main.dart';
import 'package:brandu/screens/profile/info/my/main.dart';
import 'package:brandu/screens/profile/info/point/main.dart';
import 'package:brandu/screens/profile/main.dart';
import 'package:brandu/screens/search/main.dart';
import 'package:brandu/viewmodels/auth/login.dart';
import 'package:brandu/viewmodels/order/main.dart';
import 'package:brandu/viewmodels/profile/info/coupon/main.dart';
import 'package:brandu/viewmodels/profile/info/my/main.dart';
import 'package:brandu/viewmodels/profile/info/point/main.dart';
import 'package:brandu/viewmodels/search/main.dart';
import 'package:get/get.dart';

import 'home/main.dart';

List<GetPage> appRoutes() {
  return [
    GetPage(
      name: '/home',
      page: () => const HomePage(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
      binding: HomeBinding(),
    ),
    GetPage(
      name: '/login',
      page: () => const LoginPage(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
      binding: BindingsBuilder(() {
        Get.put(LoginController());
      }),
    ),
    GetPage(
        name: '/order',
        page: () => const OrderPage(),
        transition: Transition.fade,
        transitionDuration: const Duration(milliseconds: 500),
        binding: BindingsBuilder(() {
          Get.put(OrderController());
          Get.put(ProfileMyController());
        })),
    GetPage(
      name: '/profile',
      page: () => const ProfilePage(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: '/profile/my',
      page: () => const ProfileMyPage(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: '/profile/coupon',
      page: () => const CouponPage(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
      binding: BindingsBuilder(
        () {
          Get.lazyPut(() => CouponController());
        },
      ),
    ),
    GetPage(
      name: '/profile/point',
      page: () => const ProfilePointPage(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
      binding: BindingsBuilder(
        () {
          Get.put(ProfilePointController());
        },
      ),
    ),
    GetPage(
      name: '/search',
      page: () => const SearchPage(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
      binding: BindingsBuilder(
        () {
          Get.put(SearchController());
        },
      ),
    ),
  ];
}

class MyMiddleware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    return super.onPageCalled(page);
  }
}
