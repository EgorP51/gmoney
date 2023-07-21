import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gmoney_app/core/ui/widgets/custom_dropdown.dart';
import 'package:gmoney_app/core/ui/widgets/gmoney_text_field.dart';
import 'package:gmoney_app/features/registration/registration_address/domain/controllers/registration_address_controller.dart';

class AdditionalContactWidget extends GetView<RegistrationAddressController> {
  const AdditionalContactWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
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
            label: 'Фамилия',
            controller: controller.surnameController,
            isEmptyFieldValidation: controller.isSurnameEmpty.value,
            validator: (value) => controller.surnameValidator(value),
          ),
        ),
        Obx(
          () => CustomDropdown(
            label: 'Родство',
            isEmptyFieldValidation: controller.isKinshipEmpty.value,
            items: const [
              'Домашний',
              'Родственник',
              'Друг / Подруга',
            ],
            validator: (value) => controller.kinshipValidator(value),
            controller: controller.kinshipController,
          ),
        ),
        GMoneyTextField(
          label: '+354759276402',
          controller: controller.phoneController,
          isEmptyFieldValidation: controller.isPhoneEmpty.value,
          validator: (value) => controller.phoneNumberValidator(value),
        ),
      ],
    );
  }
}
