import 'package:brandu/models/token.dart';
import 'package:brandu/services/auth.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

class LoginController extends GetxController {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  bool _isLoginPass = false;

  bool get isLoginPass => _isLoginPass;

  void setIsLoginPass() {
    _isLoginPass = true;
  }

  void googleLogin() async {
    // final user = await GoogleSignInAPI.login();
    // print(user);
  }

  void kakaoLogin() async {
    try {
      OAuthToken kakaoToken = await UserApi.instance.loginWithKakaoAccount();
      Dio dio = Dio();
      Token token = await AuthClient(dio)
          .postKaKaoAuth(AccessToken(access_token: kakaoToken.accessToken));
      await _storage.write(key: 'ACCESS_TOKEN', value: token.access_token);
      await _storage.write(key: 'REFRESH_TOKEN', value: token.refresh_token);
      Get.toNamed('/home');
    } catch (error) {}
  }
}
