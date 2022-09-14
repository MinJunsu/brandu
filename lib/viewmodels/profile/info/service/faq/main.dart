import 'package:brandu/models/service.dart';
import 'package:brandu/services/service.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class FAQController extends GetxController {
  final Rx<PaginatedFAQ> _faqs = PaginatedFAQ(count: 0, results: []).obs;

  Rx<PaginatedFAQ> get faqs => _faqs;

  @override
  void onInit() {
    super.onInit();
    fetchFAQs();
  }

  void fetchFAQs() async {
    PaginatedFAQ paginatedFAQ = await ServiceClient(Dio()).getFAQs();
    _faqs(paginatedFAQ);
  }
}
