import 'package:brandu/services/accounts.dart';
import 'package:brandu/services/auth_dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  final RxMap _productMap = {}.obs;

  final FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<bool> isAuthenticate() async {
    String? accessToken = await storage.read(key: 'ACCESS_TOKEN');
    return accessToken != null;
  }

  Future<Dio> getAuthDioOrDio() async {
    return await isAuthenticate() ? await authDio() : Dio();
  }

  bool getIsWished(int id, bool isWished) {
    _productMap.addIf(!_productMap.containsKey(id), id, {
      'isWished': isWished,
    });
    return _productMap[id]['isWished'];
  }

  void addIsWished(int id) async {
    if (!_productMap[id]['isWished']) {
      await AccountClient(await authDio()).postWishes(id);
    }
    Map temp = _productMap;
    temp[id]['isWished'] = !_productMap[id]['isWished'];
    _productMap(temp);
    // _productMap[id]['isWished'] = !_productMap[id]['isWished'];
    // _productMap.refresh();
    update();
  }
}
