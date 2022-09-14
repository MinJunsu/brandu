import 'package:brandu/models/service.dart';
import 'package:brandu/services/auth_dio.dart';
import 'package:brandu/services/service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class ServiceController extends GetxController {
  final Rx<Services> _services = Services(main_infos: [], faqs: []).obs;

  Rx<Services> get services => _services;

  @override
  void onInit() {
    super.onInit();
    fetchServices();
  }

  void fetchServices() async {
    const storage = FlutterSecureStorage();
    Services services;
    if (await storage.read(key: 'ACCESS_TOKEN') != null) {
      services = await ServiceClient(await authDio()).getServices();
    } else {
      services = await ServiceClient(Dio()).getServices();
    }
    _services(services);
  }
}
