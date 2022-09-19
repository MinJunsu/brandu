import 'package:brandu/viewmodels/auth/login.dart';
import 'package:brandu/viewmodels/category/main.dart';
import 'package:brandu/viewmodels/home/main.dart';
import 'package:brandu/viewmodels/profile/info/coupon/main.dart';
import 'package:brandu/viewmodels/profile/main.dart';
import 'package:brandu/viewmodels/profile/order/shipping/main.dart';
import 'package:get/get.dart';

class CustomBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(CouponController(), permanent: true);
    Get.put(CategoryController(), permanent: true);
    Get.put(HomeController(), permanent: true);
    Get.put(ProfileController(), permanent: true);
    Get.put(LoginController(), permanent: true);
    Get.put(ShippingController(), permanent: true);
  }
}
