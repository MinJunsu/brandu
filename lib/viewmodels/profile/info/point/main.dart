import 'package:brandu/models/account.dart';
import 'package:brandu/services/accounts.dart';
import 'package:brandu/services/auth_dio.dart';
import 'package:get/get.dart';

class ProfilePointController extends GetxController {
  late final Rx<PointHistory> _pointHistory =
      PointHistory(point: 0, point_history: []).obs;

  Rx<PointHistory> get pointHistory => _pointHistory;

  @override
  void onInit() {
    super.onInit();
    fetchPointHistory();
  }

  void fetchPointHistory() async {
    PointHistory pointHistory =
        await AccountClient(await authDio()).getPointHistory();
    _pointHistory(pointHistory);
  }
}
