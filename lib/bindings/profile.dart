import 'package:brandu/screens/profile/order/main.dart';
import 'package:brandu/viewmodels/profile/info/main.dart';
import 'package:brandu/viewmodels/profile/info/my/main.dart';
import 'package:brandu/viewmodels/profile/info/point/main.dart';
import 'package:get/get.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileInfoController());
    Get.lazyPut(() => ProfileOrderPage());
    Get.lazyPut(() => ProfileMyController());
    Get.lazyPut(() => ProfilePointController());
  }
}
