import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gmoney_app/core/navigation/app_router.dart';

class PersonalDataController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();

  late DateTime? dateOfBirth;

  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final patronymicController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final familyStatusController = TextEditingController();
  final homePhoneController = TextEditingController();
  final workPhoneController = TextEditingController();

  var isNameEmpty = false.obs;
  var isSurnameEmpty = false.obs;
  var isPatronymicEmpty = false.obs;
  var isDateOfBirthEmpty = false.obs;
  var isFamilyStatusEmpty = false.obs;
  var isHomePhoneEmpty = false.obs;

  var isCalendarShown = false.obs;

  var isMale = false.obs;
  var isFemale = false.obs;

  var canMoveToNextScreen = false;

  @override
  void onClose() {
    nameController.dispose();
    surnameController.dispose();
    patronymicController.dispose();
    dateOfBirthController.dispose();
    familyStatusController.dispose();
    homePhoneController.dispose();
    workPhoneController.dispose();
    super.onClose();
  }

  void toggleCalendar() {
    isCalendarShown.value = !isCalendarShown.value;
  }

  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }

    //TODO: update regEx!!
    /*RegExp regex = RegExp(r'^[A-Z][a-z]*$');

    if (!regex.hasMatch(value)) {
      return 'Поле не должно содержать пробелов и чисел';
    }*/

    return null;
  }

  String? dateValidator(String? value) {
    RegExp regex = RegExp(r'^\d{2}/\d{2}/\d{4}$');

    if (value == null || value.isEmpty) {
      return null;
    }

    if (!regex.hasMatch(value)) {
      return 'Неправильный формат даты';
    }

    return null;
  }

  String? homePhoneNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }

    if (!GetUtils.isPhoneNumber(value)) {
      return 'Поле должно состоять из цифр и содержать 10 цифр';
    }
    return null;
  }

  String? workPhoneNumberValidator(String? value) {
    bool allFieldsEmpty = (surnameController.text.isEmpty &&
        nameController.text.isEmpty &&
        patronymicController.text.isEmpty &&
        dateOfBirthController.text.isEmpty &&
        (!isFemale.value || !isMale.value) &&
        familyStatusController.text.isEmpty &&
        homePhoneController.text.isEmpty &&
        workPhoneController.text.isEmpty);

    if ((value == null || value.isEmpty) && allFieldsEmpty) {
      isSurnameEmpty.value = true;
      isNameEmpty.value = true;
      isPatronymicEmpty.value = true;
      isDateOfBirthEmpty.value = true;
      isFamilyStatusEmpty.value = true;
      isHomePhoneEmpty.value = true;

      return 'Данные поля являются обязательными для заполнения';
    } else {
      if (value != null && !GetUtils.isPhoneNumber(value)) {
        return 'Поле должно состоять из цифр и содержать 10 цифр';
      }
    }

    return null;
  }

  void toNextStep() {
    if (loginFormKey.currentState == null) {
      Get.snackbar('loginFormKey.currentState == null', "lkjhgbnk");
    }

    final isValid = loginFormKey.currentState!.validate();

    if (isValid) {
      // code for next step
      canMoveToNextScreen = true;
      AppRouter.navigateToOccupationIncome();
    } else {
      Get.snackbar('Форма не прошла', 'Не соврал');
    }
    loginFormKey.currentState!.save();
  }
}
