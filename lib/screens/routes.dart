import 'package:brandu/bindings/home.dart';
import 'package:brandu/bindings/profile.dart';
import 'package:brandu/screens/auth/login.dart';
import 'package:brandu/screens/category/main.dart';
import 'package:brandu/screens/order/main.dart';
import 'package:brandu/screens/profile/info/coupon/create.dart';
import 'package:brandu/screens/profile/info/coupon/main.dart';
import 'package:brandu/screens/profile/info/my/main.dart';
import 'package:brandu/screens/profile/info/notice/main.dart';
import 'package:brandu/screens/profile/info/notify/main.dart';
import 'package:brandu/screens/profile/info/point/main.dart';
import 'package:brandu/screens/profile/info/service/faq/main.dart';
import 'package:brandu/screens/profile/info/service/inquiry/main.dart';
import 'package:brandu/screens/profile/info/service/main-info/main.dart';
import 'package:brandu/screens/profile/info/service/main.dart';
import 'package:brandu/screens/profile/main.dart';
import 'package:brandu/screens/profile/order/adress/main.dart';
import 'package:brandu/screens/profile/order/adress/modify.dart';
import 'package:brandu/screens/profile/order/review/create.dart';
import 'package:brandu/screens/profile/order/review/main.dart';
import 'package:brandu/screens/profile/order/shipping/main.dart';
import 'package:brandu/screens/search/main.dart';
import 'package:brandu/viewmodels/auth/login.dart';
import 'package:brandu/viewmodels/order/main.dart';
import 'package:brandu/viewmodels/profile/info/coupon/create.dart';
import 'package:brandu/viewmodels/profile/info/coupon/main.dart';
import 'package:brandu/viewmodels/profile/info/my/main.dart';
import 'package:brandu/viewmodels/profile/info/notice/main.dart';
import 'package:brandu/viewmodels/profile/info/notify/main.dart';
import 'package:brandu/viewmodels/profile/info/point/main.dart';
import 'package:brandu/viewmodels/profile/info/service/faq/main.dart';
import 'package:brandu/viewmodels/profile/info/service/inquiry/main.dart';
import 'package:brandu/viewmodels/profile/info/service/main-info/main.dart';
import 'package:brandu/viewmodels/profile/info/service/main.dart';
import 'package:brandu/viewmodels/profile/order/address/main.dart';
import 'package:brandu/viewmodels/profile/order/address/modify.dart';
import 'package:brandu/viewmodels/profile/order/review/create.dart';
import 'package:brandu/viewmodels/profile/order/review/main.dart';
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
      }),
    ),
    GetPage(
      name: '/category',
      page: () => const CategoryPage(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
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
      name: '/profile/coupon/create',
      page: () => const CouponCreatePage(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
      binding: BindingsBuilder(
        () {
          Get.lazyPut(() => CouponCreateController());
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
      name: '/profile/notice',
      page: () => const NoticePage(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
      binding: BindingsBuilder(
        () {
          Get.put(NoticeController());
        },
      ),
    ),
    GetPage(
      name: '/profile/services',
      page: () => const ServicePage(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
      binding: BindingsBuilder(
        () {
          Get.put(ServiceController());
        },
      ),
    ),
    GetPage(
      name: '/profile/services/main-info',
      page: () => const MainInfoPage(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
      binding: BindingsBuilder(
        () {
          Get.put(MainInfoController());
        },
      ),
    ),
    GetPage(
      name: '/profile/services/faq',
      page: () => const FAQPage(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
      binding: BindingsBuilder(
        () {
          Get.put(FAQController());
        },
      ),
    ),
    GetPage(
      name: '/profile/services/inquiry',
      page: () => const InquiryPage(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
      binding: BindingsBuilder(
        () {
          Get.put(InquiryController());
        },
      ),
    ),
    GetPage(
      name: '/profile/notify',
      page: () => const NotifyPage(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
      binding: BindingsBuilder(
        () {
          Get.put(NotifyController());
        },
      ),
    ),
    GetPage(
      name: '/profile/address',
      page: () => const AddressPage(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
      binding: BindingsBuilder(
        () {
          Get.put(AddressController());
        },
      ),
    ),
    GetPage(
      name: '/profile/address/create',
      page: () => const AddressFormPage(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
      binding: BindingsBuilder(
        () {
          Get.put(AddressFormController());
        },
      ),
    ),
    GetPage(
      name: '/profile/review',
      page: () => const ReviewPage(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
      binding: BindingsBuilder(
        () {
          Get.put(ReviewController());
        },
      ),
    ),
    GetPage(
      name: '/profile/review/create',
      page: () => const ReviewCreatePage(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
      binding: BindingsBuilder(
        () {
          Get.put(ReviewCreateController());
        },
      ),
    ),
    GetPage(
      name: '/profile/shipping',
      page: () => const ShippingPage(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
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
