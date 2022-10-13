import 'package:brandu/screens/home/community/main.dart';
import 'package:brandu/screens/home/search/main.dart';
import 'package:brandu/screens/home/store/main.dart';
import 'package:brandu/screens/home/wish/main.dart';
import 'package:brandu/screens/profile/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxInt _navigatorIndex = 0.obs;
  final RxList<BottomNavigationBarItem> _items =
      const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.store_rounded),
      label: '스토어',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.comment_outlined),
      label: '커뮤니티',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.heart_broken),
      label: '찜한상품',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: '검색',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: '내정보',
    ),
  ].obs;
  final RxList<Widget> _widgetOptions = const <Widget>[
    StorePage(),
    CommunityPage(),
    WishPage(),
    SearchPage(),
    ProfilePage(),
  ].obs;

  List<BottomNavigationBarItem> get items => _items;

  List<Widget> get widgetOptions => _widgetOptions;

  int get navigatorIndex => _navigatorIndex.value;

  void onTap(int index) {
    _navigatorIndex(index);
  }
}
