import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class InquiryController extends GetxController {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _description = '';

  get formKey => _formKey;

  String get description => _description;

  String get title => _title;

  void onSubmit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
  }

  void setTitle(String? title) {
    _title = title!;
  }

  void setDescription(String? description) {
    _description = description!;
  }
}
