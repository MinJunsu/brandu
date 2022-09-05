import 'package:brandu/models/account.dart';
import 'package:get/get.dart';

class WishController extends GetxController {
  List<Wish> _wishes = [];

  List<Wish> get wishes => _wishes;

  WishPageViewModel() {}
}
