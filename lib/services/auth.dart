import 'package:brandu/models/token.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'auth.g.dart';

@RestApi(baseUrl: 'http://127.0.0.1:8000/api/v1/auth/')
abstract class AuthClient {
  factory AuthClient(Dio dio, {String baseUrl}) = _AuthClient;

  @POST('/kakao/login/')
  Future<Token> postKaKaoAuth(@Body() AccessToken accessToken);

  @POST('/google/login/')
  Future<Token> postGoogleAuth(@Body() AccessToken accessToken);

  @POST('/naver/login/')
  Future<Token> postNaverAuth(@Body() AccessToken accessToken);

  @POST('/refresh/')
  Future<Token> postRefreshToken(@Body() RefreshToken refreshToken);
}
