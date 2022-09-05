import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProfileMyController extends GetxController {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _nickname = '';
  String _name = '';
  String _phoneNumber = '';
  String _email = '';
  String _snsLink = '';
  String _description = '';

  GlobalKey<FormState> get formKey => _formKey;

  String get nickname => _nickname;

  String get name => _name;

  String get phoneNumber => _phoneNumber;

  String get email => _email;

  String get snsLink => _snsLink;

  String get description => _description;

  void onSubmit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
  }

  void setNickname(String? nickname) {
    _nickname = nickname!;
  }

  void setName(String? name) {
    _name = name!;
  }

  void setPhoneNumber(String? phoneNumber) {
    _phoneNumber = phoneNumber!;
  }

  void setEmail(String? email) {
    _email = email!;
  }

  void setSnsLink(String? snsLink) {
    _snsLink = snsLink!;
  }

  void setDescription(String? description) {
    _description = description!;
  }
}
