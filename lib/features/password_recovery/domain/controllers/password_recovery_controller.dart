import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PasswordRecoveryController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final iinController = TextEditingController();

  var isEmailEmpty = false.obs;
  var isPhoneEmpty = false.obs;

  var canMoveToNextScreen = false;

  @override
  void onClose() {
    emailController.dispose();
    phoneNumberController.dispose();
    iinController.dispose();
    super.onClose();
  }

  String? emailValidator(String? value) {
    if (value != null && !GetUtils.isEmail(value)) {
      return 'Поле должно состоять из символов на латинице, спецсимволов и цифр';
    }
    return null;
  }

  String? phoneNumberValidator(String? value) {
    if (value != null && !GetUtils.isPhoneNumber(value)) {
      return 'Поле должно состоять из цифр и содержать 10 цифр';
    }
    return null;
  }

  String? iinValidator(String? value) {
    RegExp regex = RegExp(r'^\d{12}$');

    if ((value == null || value.isEmpty) &&
        emailController.text.isEmpty &&
        phoneNumberController.text.isEmpty) {
      isEmailEmpty.value = true;
      isPhoneEmpty.value = true;

      return 'Данные поля являются обязательными для заполнения';
    } else {
      if (!regex.hasMatch(value!)) {
        return 'Поле должно соответствовать формату';
      }
    }
    return null;
  }

  void resetPassword() {
    final isValid = loginFormKey.currentState!.validate();

    if (isValid) {
      // code for password reset here
      canMoveToNextScreen = true;
    } else {
      // invalid form code
    }
    loginFormKey.currentState!.save();
  }
}
