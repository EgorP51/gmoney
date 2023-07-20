import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gmoney_app/core/ui/widgets/custom_dropdown.dart';
import 'package:gmoney_app/features/registration/occupation_income/domain/controllers/occupation_income_controller.dart';

class MinorChildrenSelector extends GetView<OccupationIncomeController> {
  const MinorChildrenSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomDropdown(
      label: 'Количество несовершеннолетних детей',
      items: const ['0', '1', '2', '3+'],
      isEmptyFieldValidation: false,
      controller: controller.minorChildrenController,
      validator: (value) => controller.minorChildrenValidator(value),
    );
  }
}
