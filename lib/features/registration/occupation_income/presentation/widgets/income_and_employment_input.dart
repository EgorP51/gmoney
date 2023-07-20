import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gmoney_app/core/ui/widgets/gmoney_text_field.dart';
import 'package:gmoney_app/features/registration/occupation_income/domain/controllers/occupation_income_controller.dart';

class IncomeAndEmploymentInput extends GetView<OccupationIncomeController> {
  const IncomeAndEmploymentInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Obx(
              () => GMoneyTextField(
            label: 'Среднемесячный доход',
            controller: controller.averageMonthlyIncomeController,
            isEmptyFieldValidation: controller.isAverageMonthlyIncomeFieldEmpty.value,
            textInputType: TextInputType.number,
            validator: (value) => controller.incomeValidation(value),
          ),
        ),
        Obx(
              () => GMoneyTextField(
            label: 'Дополнительный доход в месяц',
            controller: controller.additionalMonthlyIncomeController,
            isEmptyFieldValidation: controller.isAdditionalMonthlyIncomeFieldEmpty.value,
            textInputType: TextInputType.number,
            validator: (value) => controller.incomeValidation(value),
          ),
        ),
        Obx(
              () => GMoneyTextField(
            label: 'Место работы',
            controller: controller.workPlaceController,
            isEmptyFieldValidation: controller.isWorkPlaceFieldEmpty.value,
            validator: (value) => controller.workPlaceValidator(value),
          ),
        ),
      ],
    );
  }
}
