import 'package:brandu/models/event.dart';
import 'package:get/get.dart';

class CouponController extends GetxController {
  List<CouponHold> _coupons = [];

  List<CouponHold> get coupons => _coupons;
}
