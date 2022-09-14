import 'package:brandu/models/account.dart';
import 'package:brandu/services/accounts.dart';
import 'package:brandu/services/auth_dio.dart';
import 'package:get/get.dart';

class NotifyController extends GetxController {
  final RxBool _isStore = false.obs;
  final RxBool _isCommunity = false.obs;
  final RxBool _isEvent = false.obs;

  bool get isStore => _isStore.value;

  bool get isCommunity => _isCommunity.value;

  bool get isEvent => _isEvent.value;

  @override
  void onInit() {
    super.onInit();
    fetchNotify();
  }

  @override
  void onClose() {
    super.onClose();
    updateNotify();
  }

  void fetchNotify() async {
    Notify notify = await AccountClient(await authDio()).getNotify();
    _isStore(notify.is_store);
    _isCommunity(notify.is_community);
    _isEvent(notify.is_event);
  }

  void updateNotify() async {
    Notify notify =
        Notify(is_store: isStore, is_community: isCommunity, is_event: isEvent);
    AccountClient(await authDio()).patchNotify(notify);
  }

  void setIsStore(bool? isStore) {
    _isStore(isStore!);
  }

  void setIsCommunity(bool? isCommunity) {
    _isCommunity(isCommunity!);
  }

  void setIsEvent(bool? isEvent) {
    _isEvent(isEvent!);
  }
}
