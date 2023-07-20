import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gmoney_app/features/registration/personal_data/domain/controllers/personal_data_controller.dart';
import 'package:gmoney_app/core/ui/widgets/custom_dropdown.dart';

class MaritalStatusInputWidget extends GetView<PersonalDataController> {
  const MaritalStatusInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomDropdown(
        label: 'Семейное положение',
        isEmptyFieldValidation: controller.isFamilyStatusEmpty.value,
        items: controller.isMale.value
            ? const ['Женат', 'Не женат', 'Вдовец', 'Разведен', 'Гражданский брак']
            : const ['Замужем', 'Не замужем', 'Вдова', 'Разведена', 'Гражданский брак'],
        controller: controller.familyStatusController,
      ),
    );
  }
}
