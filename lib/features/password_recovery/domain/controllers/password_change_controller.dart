import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PasswordChangeController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();

  final passwordController = TextEditingController();
  final passwordRepeaterController = TextEditingController();

  var isPasswordEmpty = false.obs;
  var isPasswordRepeaterEmpty = false.obs;

  var canMoveToNextScreen = false;

  @override
  void onClose() {
    passwordController.dispose();
    passwordRepeaterController.dispose();
    super.onClose();
  }

  String? passwordValidator(String? value) {
    RegExp regex = RegExp(r'^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

    if ((value == null || value.isEmpty) || !regex.hasMatch(value)) {
      return 'Поле должно состоять из символов на латинице, спецсимволов и цифр';
    } else {
      return null;
    }
  }

  String? passwordRepeaterValidator(String? value) {
    RegExp regex = RegExp(r'^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

    if ((value == null || value.isEmpty) &&
        passwordController.text.isEmpty &&
        passwordRepeaterController.text.isEmpty) {
      isPasswordEmpty.value = true;
      isPasswordRepeaterEmpty.value = true;

      return 'Данные поля являются обязательными для заполнения';
    } else if (!regex.hasMatch(value!)) {
      return 'Поле должно состоять из символов на латинице, спецсимволов и цифр';
    } else if (passwordController.text != passwordRepeaterController.text) {
      return 'Пароли должны совпадать';
    }

    return null;
  }

  void changePassword() {
    final isValid = loginFormKey.currentState!.validate();

    if (isValid) {
      // here is the password change code
      canMoveToNextScreen = true;
    } else {
      // invalid form code
    }
    loginFormKey.currentState!.save();
  }
}
