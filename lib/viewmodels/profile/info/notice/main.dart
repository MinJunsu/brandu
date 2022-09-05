import 'package:brandu/models/service.dart';
import 'package:get/get.dart';

class NoticeController extends GetxController {
  List<Notice> _notices = [];
  List<NoticeWithExpanded> _noticeWithExpanded = [];

  List<Notice> get notices => _notices;

  List<NoticeWithExpanded> get noticeWithExpanded => _noticeWithExpanded;

  void setExpanded(int index, bool isExpanded) {
    _noticeWithExpanded[index].expanded = !isExpanded;
  }
}

class NoticeWithExpanded {
  final Notice notice;
  bool expanded;

  NoticeWithExpanded(this.notice, this.expanded);
}
