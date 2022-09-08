import 'package:brandu/models/event.dart';
import 'package:get/get.dart';

class CouponController extends GetxController {
  final RxList<CouponHold> _coupons = <CouponHold>[].obs;

  RxList<CouponHold> get coupons => _coupons;
}
