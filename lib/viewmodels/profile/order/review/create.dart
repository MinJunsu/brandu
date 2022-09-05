import 'package:brandu/models/account.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewCreateController extends GetxController {
  late Review review;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  double _star = 0;
  String _description = '';

  double get star => _star;

  String get description => _description;

  void onSubmit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
  }

  void setStar(double star) {
    _star = star;
  }

  void setDescription(String? description) {
    _description = description!;
  }
}
