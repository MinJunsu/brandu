import 'package:brandu/models/search.dart';
import 'package:brandu/services/auth_dio.dart';
import 'package:brandu/services/search.dart';
import 'package:brandu/viewmodels/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  final TextEditingController _controller = TextEditingController();
  final RxList<RecentSearch> _recentSearches = <RecentSearch>[].obs;
  final RxList<SearchRank> _searchRanks = <SearchRank>[].obs;

  TextEditingController get controller => _controller;

  List<SearchRank> get searchRanks => _searchRanks;

  List<RecentSearch> get recentSearches => _recentSearches;

  @override
  void onInit() {
    super.onInit();
    fetchRecentSearches();
    fetchSearchRanks();
  }

  void fetchRecentSearches() async {
    if (await Get.find<BaseController>().isAuthenticate()) {
      return;
    }
    List<RecentSearch> recentSearches =
        await SearchClient(await authDio()).getRecentSearches();
    _recentSearches(recentSearches);
  }

  void fetchSearchRanks() async {
    List<SearchRank> searchRanks = await SearchClient(Dio()).getSearchRanks();
    _searchRanks(searchRanks);
  }
}
