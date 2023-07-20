import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gmoney_app/core/ui/widgets/custom_dropdown.dart';
import 'package:gmoney_app/features/registration/occupation_income/domain/controllers/occupation_income_controller.dart';

class AspRecipientWidget extends GetView<OccupationIncomeController> {
  const AspRecipientWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => CustomDropdown(
        label: 'Получатель АСП',
        isEmptyFieldValidation: controller.isAspRecipientFieldEmpty.value,
        items: const ['Да', 'Нет'],
        validator: (value) => controller.aspValidator(value),
        controller: controller.aspRecipientController,
      ),
    );
  }
}
