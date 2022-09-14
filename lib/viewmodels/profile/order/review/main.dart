import 'package:brandu/models/account.dart';
import 'package:brandu/services/accounts.dart';
import 'package:brandu/services/auth_dio.dart';
import 'package:get/get.dart';

class ReviewController extends GetxController {
  final RxBool _isWritable = true.obs;
  final RxBool _isWrote = false.obs;
  final RxList<bool> _isSelected = [true, false].obs;
  final RxList<Review> _reviews = <Review>[].obs;

  List<Review> get writable =>
      _reviews.where((element) => element.is_write == false).toList();

  List<Review> get wrote =>
      _reviews.where((element) => element.is_write).toList();

  List<Review> get reviews => _isWritable.value ? writable : wrote;

  bool get isWritable => _isWritable.value;

  bool get isWrote => _isWrote.value;

  List<bool> get isSelected => _isSelected;

  @override
  void onInit() {
    super.onInit();
    _isSelected([isWritable, isWrote]);
    fetchReviews();
  }

  void toggleSelect(int value) {
    if (value == 0) {
      _isWritable(true);
      _isWrote(false);
    } else {
      _isWritable(false);
      _isWrote(true);
    }
    _isSelected([isWritable, isWrote]);
  }

  void fetchReviews() async {
    List<Review> reviews = await AccountClient(await authDio()).getReviews();
    _reviews(reviews);
  }
}
