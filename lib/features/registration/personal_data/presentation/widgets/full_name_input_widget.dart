import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gmoney_app/core/ui/widgets/gmoney_text_field.dart';
import 'package:gmoney_app/features/registration/personal_data/domain/controllers/personal_data_controller.dart';

class FullNameInputWidget extends GetView<PersonalDataController> {
  const FullNameInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Obx(
          () => GMoneyTextField(
            label: 'Фамилия',
            controller: controller.surnameController,
            isEmptyFieldValidation: controller.isSurnameEmpty.value,
            validator: (value) => controller.nameValidator(value),
          ),
        ),
        Obx(
          () => GMoneyTextField(
            label: 'Имя',
            controller: controller.nameController,
            isEmptyFieldValidation: controller.isNameEmpty.value,
            validator: (value) => controller.nameValidator(value),
          ),
        ),
        Obx(
          () => GMoneyTextField(
            label: 'Отчество',
            controller: controller.patronymicController,
            isEmptyFieldValidation: controller.isPatronymicEmpty.value,
            validator: (value) => controller.nameValidator(value),
          ),
        ),
      ],
    );
  }
}
