import 'package:brandu/models/account.dart';
import 'package:brandu/models/order.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'accounts.g.dart';

@RestApi(baseUrl: 'http://127.0.0.1:8000/api/v1/accounts/')
abstract class AccountClient {
  factory AccountClient(Dio dio, {String baseUrl}) = _AccountClient;

  @GET('/me/')
  Future<Profile> getProfile();

  @GET('/point/')
  Future<PointHistory> getPointHistory();

  @GET('/notify/')
  Future<Notify> getNotify();

  @PATCH('/notify/')
  Future<void> patchNotify(@Body() Notify notify);

  @GET('/baskets/')
  Future<List<Basket>> getBaskets();

  @PATCH('/edit/')
  Future<Profile> patchProfile(@Body() Profile profile);

  @GET('/summary/')
  Future<ProfileSummary> getProfileSummary();

  @POST('/basket/{id}/')
  Future<void> postBaskets(@Path("id") int id);

  @DELETE('/basket/{id}/')
  Future<void> deleteBaskets(@Path("id") int id);

  @GET('/wishes/')
  Future<List<Wish>> getWishes();

  @POST('/wish/{id}/')
  Future<void> postWishes(@Path("id") int id);

  @DELETE('/wish/{id}/')
  Future<void> deleteWishes(@Path("id") int id);

  @GET('/review/')
  Future<List<Review>> getReviews();

  @POST('/review/')
  Future<Review> postReview(@Body() Review review);

  @PUT('/review/{id}/')
  Future<void> putReview(@Path('id') int id, @Body() Review review);

  @DELETE('/review/{id}/')
  Future<void> deleteReview(@Path('id') int id);

  @GET('/addresses/')
  Future<List<Address>> getAddresses();

  @POST('/addresses/')
  Future<Address> postAddresses(@Body() Address address);

  @PATCH('/address/{id}/')
  Future<Address> patchAddress(@Path("id") int id, @Body() Address address);

  @DELETE('/address/{id}/')
  Future<void> deleteAddress(@Path('id') int id);

  @PATCH('/address/{id}/main/')
  Future<void> patchAddressMain(@Path('id') int id);

  @GET('/orders/')
  Future<List<Order>> getOrders();
}
