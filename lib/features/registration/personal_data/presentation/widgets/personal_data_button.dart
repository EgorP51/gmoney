import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gmoney_app/core/ui/widgets/gmoney_button.dart';
import 'package:gmoney_app/features/registration/personal_data/domain/controllers/personal_data_controller.dart';

class PersonalDataButton extends GetView<PersonalDataController> {
  const PersonalDataButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GMoneyButton(
      title: Text(
        'Далее'.toUpperCase(),
      ),
      onPressed: () {
        controller.toNextStep();
      },
    );
  }
}
