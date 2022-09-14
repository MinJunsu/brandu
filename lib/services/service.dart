import 'package:brandu/models/service.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'service.g.dart';

@RestApi(baseUrl: 'http://127.0.0.1:8000/api/v1/services')
abstract class ServiceClient {
  factory ServiceClient(Dio dio, {String baseUrl}) = _ServiceClient;

  @GET('/')
  Future<Services> getServices();

  @GET('/notice/')
  Future<List<Notice>> getNotices();

  @GET('/main-info/')
  Future<PaginatedMainInfo> getMainInfo();

  @GET('/faq/')
  Future<PaginatedFAQ> getFAQs();

  @GET('/inquiry/')
  Future<List<Inquiry>> getInquiries();

  @POST('/inquiry/')
  Future<Inquiry> postInquiry(@Body() Inquiry inquiry);

  @PATCH('/inquiry/{id}')
  Future<Inquiry> patchInquiry(
    @Path("id") int id,
    @Body() Inquiry inquiry,
  );
}
