import 'package:brandu/models/event.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'events.g.dart';

@RestApi(baseUrl: 'http://127.0.0.1:8000/api/v1/events/')
abstract class EventClient {
  factory EventClient(Dio dio, {String baseUrl}) = _EventClient;

  @GET('/carousel/')
  Future<List<Advertisement>> getCarousel();
}
