import 'package:brandu/models/search.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'search.g.dart';

@RestApi(baseUrl: 'http://127.0.0.1:8000/api/v1/search/')
abstract class SearchClient {
  factory SearchClient(Dio dio, {String baseUrl}) = _SearchClient;

  @GET('/history/')
  Future<List<RecentSearch>> getRecentSearches();

  @GET('/rank/')
  Future<List<SearchRank>> getSearchRanks();
}
