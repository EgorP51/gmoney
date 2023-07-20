import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gmoney_app/core/ui/widgets/custom_dropdown.dart';
import 'package:gmoney_app/features/registration/occupation_income/domain/controllers/occupation_income_controller.dart';

class JobPositionSelector extends GetView<OccupationIncomeController> {
  const JobPositionSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomDropdown(
        label: 'Должность',
        isEmptyFieldValidation: controller.isJobPositionFieldEmpty.value,
        items: const [
          'Директор',
          'Главный бухгалтер',
          'Начальник',
          'Специалист',
          'Рабочий'
        ],
        controller: controller.jobPositionController,
        validator: (value) => controller.jobPositionValidator(value),
      ),
    );
  }
}
