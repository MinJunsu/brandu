import 'package:brandu/models/account.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'accounts.g.dart';

@RestApi(baseUrl: 'http://127.0.0.1:8000/api/v1/accounts/')
abstract class AccountClient {
  factory AccountClient(Dio dio, {String baseUrl}) = _AccountClient;

  @GET('/me/')
  Future<Profile> getProfile();

  @GET('/baskets/')
  Future<List<Basket>> getBaskets();

  @PATCH('/edit/')
  Future<Profile> patchProfile(@Body() Profile profile);

  @POST('/basket/{id}/')
  Future<void> postBaskets(@Path("id") int id);

  @DELETE('/basket/{id}/')
  Future<void> deleteBaskets(@Path("id") int id);

  @GET('/wishes/')
  Future<List<Wish>> getWishes();

  @POST('/wish/{id}/')
  Future<Wish> postWishes(@Path("id") int id);

  @DELETE('/wish/{id}/')
  Future<void> deleteWishes(@Path("id") int id);
}
