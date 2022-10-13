import 'package:brandu/models/service.dart';
import 'package:brandu/services/service.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class NoticeController extends GetxController {
  final RxList<Notice> _notices = <Notice>[].obs;

  List<Notice> get notices => _notices;

  @override
  void onInit() {
    super.onInit();
    fetchNotices();
  }

  void fetchNotices() async {
    List<Notice> notices = await ServiceClient(Dio()).getNotices();
    _notices(notices);
  }
}
