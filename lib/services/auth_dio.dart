import 'package:brandu/models/token.dart';
import 'package:brandu/services/auth.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<Dio> authDio() async {
  var dio = Dio();

  const storage = FlutterSecureStorage();

  dio.interceptors.clear();

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        final accessToken = await storage.read(key: 'ACCESS_TOKEN');

        options.headers['Authorization'] = 'Bearer $accessToken';
        return handler.next(options);
      },
      onError: (error, handler) async {
        if (error.response?.statusCode == 401) {
          final refreshToken = await storage.read(key: 'REFRESH_TOKEN');

          var refreshDio = Dio();

          refreshDio.interceptors.clear();

          refreshDio.interceptors.add(
            InterceptorsWrapper(
              onError: (error, handler) async {
                if (error.response?.statusCode == 401) {
                  await storage.deleteAll();

                  // 로그인 만료 dialog 발생 후 로그인 페이지로 이동
                }
                return handler.next(error);
              },
            ),
          );

          Token token = await AuthClient(refreshDio)
              .postRefreshToken(RefreshToken(refresh_token: refreshToken!));

          await storage.write(key: 'ACCESS_TOKEN', value: token.access_token);
          await storage.write(key: 'REFRESH_TOKEN', value: token.refresh_token);

          error.requestOptions.headers['Authorization'] =
              'Bearer ${token.access_token}';

          final clonedRequest = await dio.request(error.requestOptions.path,
              options: Options(
                  method: error.requestOptions.method,
                  headers: error.requestOptions.headers),
              data: error.requestOptions.data,
              queryParameters: error.requestOptions.queryParameters);

          // API 복사본으로 재요청
          return handler.resolve(clonedRequest);
        }

        return handler.next(error);
      },
    ),
  );

  return dio;
}
