import 'package:brandu/screens/bindings.dart';
import 'package:brandu/screens/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

void main() async {
  // for flutter config
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();

  // for kakao
  KakaoSdk.init(nativeAppKey: FlutterConfig.get('KAKAO_NATIVE'));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/home',
      getPages: appRoutes(),
      initialBinding: CustomBindings(),
    );
  }
}
