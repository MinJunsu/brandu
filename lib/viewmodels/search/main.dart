import 'package:brandu/models/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  final TextEditingController _controller = TextEditingController();
  List<RecentSearch> _recentSearches = [];
  List<SearchRank> _searchRanks = [];

  TextEditingController get controller => _controller;

  List<SearchRank> get searchRanks => _searchRanks;

  List<RecentSearch> get recentSearches => _recentSearches;
}
