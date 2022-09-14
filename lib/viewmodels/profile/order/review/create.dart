import 'package:brandu/models/account.dart';
import 'package:brandu/services/accounts.dart';
import 'package:brandu/services/auth_dio.dart';
import 'package:brandu/viewmodels/profile/order/review/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewCreateController extends GetxController {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final RxDouble _star = 0.0.obs;
  final Rx<DateTime> _paymentDay = DateTime(2022).obs;
  final RxString _productName = ''.obs;
  final RxString _description = ''.obs;
  final RxBool _isWrite = false.obs;
  int id = 0;

  GlobalKey<FormState> get formKey => _formKey;

  DateTime get paymentDay => _paymentDay.value;

  double get star => _star.value;

  String get productName => _productName.value;

  bool get isWrite => _isWrite.value;

  String get description => _description.value;

  void setDefaultValue(Review review) {
    id = review.id;
    _productName(review.product_name);
    _description(review.description);
    _isWrite(review.is_write);
    _star(review.star / 2);
  }

  void onSubmit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Review newReview = Review(
        id: id,
        product_name: productName,
        payment_day: paymentDay,
        is_write: isWrite,
        star: (star * 2).toInt(),
        description: description,
      );
      if (isWrite) {
        await AccountClient(await authDio()).putReview(id, newReview);
      }

      Get.find<ReviewController>().fetchReviews();
    }
  }

  void setStar(double star) {
    _star(star);
  }

  void setDescription(String? description) {
    _description(description!);
  }
}
