import 'package:brandu/models/service.dart';
import 'package:brandu/services/service.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class MainInfoController extends GetxController {
  final Rx<PaginatedMainInfo> _mainInfo =
      PaginatedMainInfo(count: 0, results: []).obs;

  Rx<PaginatedMainInfo> get mainInfo => _mainInfo;

  @override
  void onInit() {
    super.onInit();
    fetchMainInfo();
  }

  void fetchMainInfo() async {
    PaginatedMainInfo paginatedMainInfo =
        await ServiceClient(Dio()).getMainInfo();
    _mainInfo(paginatedMainInfo);
  }
}
