import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gmoney_app/core/ui/widgets/gmoney_button.dart';
import 'package:gmoney_app/features/registration/occupation_income/domain/controllers/occupation_income_controller.dart';

class OccupationIncomeButton extends GetView<OccupationIncomeController> {
  const OccupationIncomeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GMoneyButton(
      title: Text('Далее'.toUpperCase()),
      onPressed: (){
        controller.toNextStep();
      },
    );
  }
}
