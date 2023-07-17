import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();

  var isEmailEmpty = false.obs;
  var isPhoneEmpty = false.obs;

  @override
  void onClose() {
    emailController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
    } else {
      if (!GetUtils.isEmail(value)) {
        return 'Поле должно состоять из символов на латинице, спецсимволов и цифр';
      }
    }
    return null;
  }

  String? phoneNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
    } else {
      if (!GetUtils.isPhoneNumber(value)) {
        return 'Поле должно состоять из цифр и содержать 10 цифр';
      }
    }
    return null;
  }

  String? passwordValidator(String? value) {
    RegExp regex = RegExp(r'^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

    if ((value == null || value.isEmpty) &&
        emailController.text.isEmpty &&
        phoneNumberController.text.isEmpty) {
      isEmailEmpty.value = true;
      isPhoneEmpty.value = true;

      return 'Данные поля являются обязательными для заполнения';
    } else {
      if (!regex.hasMatch(value!)) {
        return 'Поле должно состоять из символов на латинице, спецсимволов и цифр';
      }
    }
    return null;
  }

  void login() {
    final isValid = loginFormKey.currentState!.validate();

    if (isValid) {
      // here logic for login
    } else {
      // here is a response to an invalid form
    }

    loginFormKey.currentState!.save();
  }
}
