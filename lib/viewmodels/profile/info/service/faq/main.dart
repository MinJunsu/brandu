import 'package:brandu/models/service.dart';
import 'package:get/get.dart';

class FAQController extends GetxController {
  late PaginatedFAQ _faqs;
  List<FAQWithExpanded> _faqWithExpands = [];

  PaginatedFAQ get faqs => _faqs;

  List<FAQWithExpanded> get faqWithExpands => _faqWithExpands;

  @override
  void onInit() {
    super.onInit();
    _faqWithExpands = List.generate(
      _faqs.results.length,
          (index) =>
          FAQWithExpanded(
            _faqs.results[index],
            false,
          ),
    );
  }

  void setExpanded(int index, bool isExpanded) {
    _faqWithExpands[index].expanded = !isExpanded;
  }
}

class FAQWithExpanded {
  final FAQ faq;
  bool expanded;

  FAQWithExpanded(this.faq, this.expanded);
}
