import 'package:brandu/models/service.dart';
import 'package:get/get.dart';

class MainInfoController extends GetxController {
  late PaginatedMainInfo _mainInfo;
  List<MainInfoWithExpanded> _mainIntoWithExpands = [];

  List<MainInfoWithExpanded> get mainIntoWithExpands => _mainIntoWithExpands;

  @override
  void onInit() {
    super.onInit();
    _mainIntoWithExpands = List.generate(
      _mainInfo.results.length,
      (index) => MainInfoWithExpanded(
        _mainInfo.results[index],
        false,
      ),
    );
  }

  void setExpanded(int index, bool isExpanded) {
    _mainIntoWithExpands[index].expanded = !isExpanded;
  }
}

class MainInfoWithExpanded {
  final MainInfo mainInfo;
  bool expanded;

  MainInfoWithExpanded(this.mainInfo, this.expanded);
}
