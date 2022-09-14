import 'package:brandu/models/event.dart';
import 'package:brandu/services/auth_dio.dart';
import 'package:brandu/services/events.dart';
import 'package:get/get.dart';

class CouponController extends GetxController {
  final RxList<CouponHold> _coupons = <CouponHold>[].obs;

  RxList<CouponHold> get coupons => _coupons;

  @override
  void onInit() {
    super.onInit();
    fetchCoupons();
  }

  void fetchCoupons() async {
    List<CouponHold> coupons = await EventClient(await authDio()).getCoupons();
    _coupons(coupons);
  }
}
