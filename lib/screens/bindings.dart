import 'package:brandu/viewmodels/auth/login.dart';
import 'package:brandu/viewmodels/category/main.dart';
import 'package:brandu/viewmodels/home/main.dart';
import 'package:brandu/viewmodels/home/search/main.dart';
import 'package:brandu/viewmodels/main.dart';
import 'package:brandu/viewmodels/profile/info/my/main.dart';
import 'package:brandu/viewmodels/profile/main.dart';
import 'package:get/get.dart';

class CustomBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(BaseController(), permanent: true);
    Get.put(LoginController(), permanent: true);
    Get.put(HomeController(), permanent: true);
    Get.put(ProfileController(), permanent: true);
    Get.put(ProfileMyController(), permanent: true);
    Get.put(CategoryController(), permanent: true);
    Get.put(SearchController(), permanent: true);
  }
}
