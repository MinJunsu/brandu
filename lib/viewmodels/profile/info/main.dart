import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class ProfileInfoController extends GetxController {
  final storage = const FlutterSecureStorage();

  void logout() async {
    await Future.delayed(const Duration(seconds: 1));
    await storage.delete(key: 'ACCESS_TOKEN');
    await storage.delete(key: 'REFRESH_TOKEN');
    await Get.deleteAll();
    Get.toNamed('/login');
  }
}
