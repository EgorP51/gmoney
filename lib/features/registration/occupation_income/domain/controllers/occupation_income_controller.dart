import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OccupationIncomeController extends GetxController {
  final occupationIncomeFormKey = GlobalKey<FormState>();

  final aspRecipientController = TextEditingController();
  final averageMonthlyIncomeController = TextEditingController();
  final additionalMonthlyIncomeController = TextEditingController();
  final workPlaceController = TextEditingController();
  final jobPositionController = TextEditingController();
  final minorChildrenController = TextEditingController();

  final isAspRecipientFieldEmpty = false.obs;
  final isAverageMonthlyIncomeFieldEmpty = false.obs;
  final isAdditionalMonthlyIncomeFieldEmpty = false.obs;
  final isWorkPlaceFieldEmpty = false.obs;
  final isJobPositionFieldEmpty = false.obs;

  var canMoveToNextScreen = false;

  String? incomeValidation(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }
    if (int.tryParse(value) == null) {
      return 'Значение должно быть целым числом';
    }
    return null;
  }

  String? workPlaceValidator(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }
    //TODO: Добавить валидацию для поля ввода места работы!

    return null;
  }

  String? aspValidator(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }
    if (value != 'Да' && value != 'Нет') {
      return 'Выберите Да или Нет';
    }
    return null;
  }

  String? jobPositionValidator(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }
    bool correctJobPosition = [
      'Директор',
      'Главный бухгалтер',
      'Начальник',
      'Специалист',
      'Рабочий'
    ].contains(value);

    if (!correctJobPosition) {
      return 'Выберите значение из списка';
    }
    return null;
  }


  String? minorChildrenValidator(String? value) {
    bool allFieldsEmpty = (aspRecipientController.text.isEmpty &&
        averageMonthlyIncomeController.text.isEmpty &&
        additionalMonthlyIncomeController.text.isEmpty &&
        workPlaceController.text.isEmpty &&
        jobPositionController.text.isEmpty &&
        minorChildrenController.text.isEmpty);

    if ((value == null || value.isEmpty) && allFieldsEmpty) {
      isAspRecipientFieldEmpty.value = true;
      isAverageMonthlyIncomeFieldEmpty.value = true;
      isAdditionalMonthlyIncomeFieldEmpty.value = true;
      isWorkPlaceFieldEmpty.value = true;
      isJobPositionFieldEmpty.value = true;

      return 'Данные поля являются обязательными для заполнения';
    } else {
      bool correctChildrenCountPosition = [
        '0',
        '1',
        '2',
        '3+',
      ].contains(value);

      if (!correctChildrenCountPosition) {
        return 'Выберите значение из списка';
      }
      return null;
    }
  }

  void toNextStep() {
    if (occupationIncomeFormKey.currentState == null) {
      Get.snackbar('loginFormKey.currentState == null', "lkjhgbnk");
    }

    final isValid = occupationIncomeFormKey.currentState!.validate();

    if (isValid) {
      // code for next step
      canMoveToNextScreen = true;
    } else {
      Get.snackbar('Форма не прошла', 'Не соврал');
    }
    occupationIncomeFormKey.currentState!.save();
  }
}
