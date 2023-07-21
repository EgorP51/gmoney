import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gmoney_app/core/ui/widgets/gmoney_button.dart';
import 'package:gmoney_app/features/registration/registration_address/domain/controllers/registration_address_controller.dart';

class RegistrationAddressButton extends GetView<RegistrationAddressController>{
  const RegistrationAddressButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  GMoneyButton(
      title: Text(
        'Далее'.toUpperCase(),
      ),
      onPressed: () {
        controller.toNextStep();
      },
    );
  }
}
