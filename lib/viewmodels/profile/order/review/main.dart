import 'package:brandu/models/account.dart';
import 'package:get/get.dart';

class ReviewController extends GetxController {
  bool _isWritable = true;
  bool _isWrote = false;
  late List<bool> _isSelected;
  List<Review> _reviews = [];

  List<Review> get writable =>
      _reviews.where((element) => element.is_write == false).toList();

  List<Review> get wrote =>
      _reviews.where((element) => element.is_write).toList();

  List<Review> get reviews =>
      _isWritable ? writable : wrote;

  bool get isWritable => _isWritable;

  bool get isWrote => _isWrote;

  List<bool> get isSelected => _isSelected;

  @override
  void onInit() {
    super.onInit();
    _isSelected = [_isWritable, _isWrote];
  }

  void toggleSelect(int value) {
    if (value == 0) {
      _isWritable = true;
      _isWrote = false;
    } else {
      _isWritable = false;
      _isWrote = true;
    }
    _isSelected = [_isWritable, _isWrote];
  }


}
