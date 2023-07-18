import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gmoney_app/core/navigation/app_router.dart';

class ContactInformationController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();

  final iinController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();

  var isEmailEmpty = false.obs;
  var isIinEmpty = false.obs;

  @override
  void onClose() {
    emailController.dispose();
    phoneNumberController.dispose();
    iinController.dispose();
    super.onClose();
  }
  String? iinValidator(String? value) {
    RegExp regex = RegExp(r'^\d{12}$');

    if(value == null || value.isEmpty){
      return null;
    }

    if (!regex.hasMatch(value)) {
      return 'Поле должно соответствовать формату';
    }
    return null;
  }
  String? emailValidator(String? value) {

    if (value == null || value.isEmpty) {
      return null;
    }

    if (!GetUtils.isEmail(value)) {
      return 'Поле должно состоять из символов на латинице, спецсимволов и цифр';
    }

    return null;
  }

  String? phoneNumberValidator(String? value) {
    if ((value == null || value.isEmpty) &&
        emailController.text.isEmpty &&
        phoneNumberController.text.isEmpty) {
      isEmailEmpty.value = true;
      isIinEmpty.value = true;

      return 'Данные поля являются обязательными для заполнения';
    } else {
      if (value != null && !GetUtils.isPhoneNumber(value)) {
        return 'Поле должно состоять из цифр и содержать 10 цифр';
      }
    }

    return null;
  }

  void confirmInformation() {
    final isValid = loginFormKey.currentState!.validate();

    if (isValid) {
      // here will send a message to the phone for confirmation
      AppRouter.navigateToSmsConfirmation();
    } else {
      // invalid form code
    }
    loginFormKey.currentState!.save();
  }
}
