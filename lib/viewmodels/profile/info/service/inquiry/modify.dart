import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class InquiryModifyController extends GetxController {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _description = '';

  get formKey => _formKey;

  String get title => _title;

  String get description => _description;

  void onSubmit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
  }

  void deleteInquiry() async {}

  void setTitle(String? title) {
    _title = title!;
  }

  void setDescription(String? description) {
    _description = description!;
  }
}
