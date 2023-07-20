import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gmoney_app/core/ui/theme/gmoney_text_styles.dart';
import 'package:gmoney_app/core/ui/widgets/gmoney_text_field.dart';
import 'package:gmoney_app/features/registration/personal_data/domain/controllers/personal_data_controller.dart';

class PhoneInputField extends GetView<PersonalDataController> {
  const PhoneInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child:
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text('Контакты', style: context.gmoneyTextStyle.small),
          ),
        ),
        Obx(
              () => GMoneyTextField(
            label: 'Домашний телефон',
            controller: controller.homePhoneController,
            textInputType: TextInputType.phone,
            isEmptyFieldValidation: controller.isHomePhoneEmpty.value,
            validator: (value) => controller.homePhoneNumberValidator(value),
          ),
        ),
        GMoneyTextField(
          label: 'Рабочий телефон',
          controller: controller.workPhoneController,
          textInputType: TextInputType.phone,
          validator: (value) => controller.workPhoneNumberValidator(value),
        )
      ],
    );
  }
}
