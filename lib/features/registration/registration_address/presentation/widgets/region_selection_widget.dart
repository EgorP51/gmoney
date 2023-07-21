import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gmoney_app/core/ui/widgets/custom_dropdown.dart';
import 'package:gmoney_app/features/registration/registration_address/domain/controllers/registration_address_controller.dart';

class RegionSelectionWidget extends GetView<RegistrationAddressController> {
  const RegionSelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
          () =>
          CustomDropdown(
            label: 'Регион',
            isEmptyFieldValidation: controller.isRegionEmpty.value,
            //list from backend
            items: const [
              'Акмолинская область',
              'Актюбинская область',
              'Алматинская область',
              'Атырауская область',
              'Карагандинская область',
              'Костанайская область',
              'Мангистауская область',
              'Павлодарская область',
              'Туркестанская область'
            ],
            validator: (value) => controller.regionValidator(value),
            controller: controller.regionController,
          ),
    );
  }
}
