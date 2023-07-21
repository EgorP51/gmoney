import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BankAccountController extends GetxController {
  final bankAccountFormKey = GlobalKey<FormState>();

  final bankAccountController = TextEditingController();
  final idNumberController = TextEditingController();
  final issueDateController = TextEditingController();
  final validityController = TextEditingController();
  final issuingAuthorityController = TextEditingController();

  DateTime? issueDate;
  DateTime? validityDate;

  var isIssuingAuthorityEmpty = false.obs;
  var isBankAccountEmpty = false.obs;
  var isIDNumberEmpty = false.obs;
  var isIssueDateEmpty = false.obs;
  var isValidityEmpty = false.obs;

  var isCalendarShown = false.obs;

  void toggleCalendar() {
    isCalendarShown.value = !isCalendarShown.value;
  }

  String? issuingAuthorityValidator(String? value) {
    bool allFieldsEmpty = (idNumberController.text.isEmpty ||
        issueDateController.text.isEmpty ||
        validityController.text.isEmpty ||
        issuingAuthorityController.text.isEmpty ||
        bankAccountController.text.isEmpty);

    if (allFieldsEmpty) {
      isIssueDateEmpty.value = true;
      isIDNumberEmpty.value = true;
      isValidityEmpty.value = true;
      isIssuingAuthorityEmpty.value = true;
      isBankAccountEmpty.value = true;
      return 'Данные поля являются обязательными для заполнения';
    } else {
      if (value == null || value.isEmpty) {
        return null;
      }

      var items = [
        'МЮ РК',
        'МВД РК',
      ];

      if (!items.contains(value)) {
        return 'Выберите значание из списка';
      }
    }

    return null;
  }

  String? bankAccountValidator(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }

    RegExp regExp = RegExp(r'^[0-9a-zA-Z]+$');
    if (!regExp.hasMatch(value)) {
      return 'Поле должно содержать только цифры или буквы латиницей';
    }

    if (value.length != 18) {
      return 'Поле должно содержать 18 цифр или букв латиницей';
    }

    if (!value.startsWith('KZ')) {
      return 'Номер должен начинаться с KZ';
    }

    return null;
  }

  String? identityNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }

    RegExp regExp = RegExp(r'^\d+$');
    if (!regExp.hasMatch(value)) {
      return 'Поле должно содержать только цифры';
    }

    if (value.length != 12) {
      return 'Поле должно содержать 12 цифр';
    }

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

    if ((validityDate != null && issueDate != null) &&
        (validityDate!.isBefore(issueDate!))) {
      return 'Срок действия не может быть раньше даты выдачи';
    }

    return null;
  }

  void toNextStep() {
    if (bankAccountFormKey.currentState == null) {
      Get.snackbar('loginFormKey.currentState == null', "lkjhgbnk");
    }

    final isValid = bankAccountFormKey.currentState!.validate();

    if (isValid) {
      // code for next step
    } else {
      Get.snackbar('Форма не прошла', 'Не соврал');
    }
    bankAccountFormKey.currentState!.save();
  }
}
