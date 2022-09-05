import 'package:get/get.dart';

class NotifyController extends GetxController {
  bool _isStore = false;
  bool _isCommunity = false;
  bool _isEvent = false;

  bool get isStore => _isStore;

  bool get isCommunity => _isCommunity;

  bool get isEvent => _isEvent;

  void setIsStore(bool? isStore) {
    _isStore = isStore!;
  }

  void setIsCommunity(bool? isCommunity) {
    _isCommunity = isCommunity!;
  }

  void setIsEvent(bool? isEvent) {
    _isEvent = isEvent!;
  }
}
