import 'package:brandu/models/account.dart';
import 'package:brandu/services/accounts.dart';
import 'package:brandu/services/auth_dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProfileMyController extends GetxController {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final RxString _nickname = ''.obs;
  final RxString _name = ''.obs;
  final RxString _phoneNumber = ''.obs;
  final RxString _email = ''.obs;
  final RxString _snsLink = ''.obs;
  final RxString _description = ''.obs;

  GlobalKey<FormState> get formKey => _formKey;

  RxString get nickname => _nickname;

  RxString get name => _name;

  RxString get phoneNumber => _phoneNumber;

  RxString get email => _email;

  RxString get snsLink => _snsLink;

  RxString get description => _description;

  @override
  void onInit() {
    super.onInit();
    fetchProfile();
  }

  void fetchProfile() async {
    Profile profile = await AccountClient(await authDio()).getProfile();
    updateProfile(profile);
  }

  void updateProfile(Profile profile) async {
    _nickname(profile.nickname);
    _name(profile.name);
    _phoneNumber(profile.phone_number);
    _email(profile.email);
    _snsLink(profile.social_link);
    _description(profile.description);
  }

  void onSubmit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Profile updatedProfile = Profile(
        nickname: _nickname.value,
        name: _name.value,
        phone_number: _phoneNumber.value,
        email: _email.value,
        social_link: _snsLink.value,
        description: _description.value,
      );
      Profile profile =
          await AccountClient(await authDio()).patchProfile(updatedProfile);
      updateProfile(profile);
      // TODO: 수정 완료 Alert 창
    }
  }

  void setNickname(String? nickname) {
    _nickname(nickname!);
  }

  void setName(String? name) {
    _name(name!);
  }

  void setPhoneNumber(String? phoneNumber) {
    _phoneNumber(phoneNumber!);
  }

  void setEmail(String? email) {
    _email(email!);
  }

  void setSnsLink(String? snsLink) {
    _snsLink(snsLink!);
  }

  void setDescription(String? description) {
    _description(description!);
  }
}
