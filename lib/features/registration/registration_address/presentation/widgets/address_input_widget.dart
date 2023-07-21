import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gmoney_app/core/ui/widgets/gmoney_text_field.dart';
import 'package:gmoney_app/features/registration/registration_address/domain/controllers/registration_address_controller.dart';

class AddressInputWidget extends GetView<RegistrationAddressController>{
  const AddressInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Obx(
              () => GMoneyTextField(
            label: 'Населенный пункт',
            controller: controller.localityController,
            isEmptyFieldValidation: controller.isLocalityEmpty.value,
            validator: (value) => controller.localityValidator(value),
          ),
        ),
        Obx(
              () => GMoneyTextField(
            label: 'Улица/Микрорайон',
            controller: controller.streetController,
            isEmptyFieldValidation: controller.isStreetEmpty.value,
            validator: (value) => controller.streetValidator(value),
          ),
        ),
        Obx(
              () => GMoneyTextField(
            label: 'Дом',
            controller: controller.houseController,
            isEmptyFieldValidation: controller.isHouseEmpty.value,
            validator: (value) => controller.houseValidator(value),
          ),
        ),
        Obx(
              () => GMoneyTextField(
            label: 'Квартира',
            controller: controller.apartmentController,
            isEmptyFieldValidation: controller.isApartmentEmpty.value,
            validator: (value) => controller.apartmentValidator(value),
          ),
        ),
      ],
    );
  }
}
