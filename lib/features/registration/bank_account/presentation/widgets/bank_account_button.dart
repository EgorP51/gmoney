import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gmoney_app/core/ui/widgets/gmoney_button.dart';
import 'package:gmoney_app/features/registration/bank_account/domain/controllers/bank_account_controller.dart';

class BankAccountButton extends GetView<BankAccountController> {
  const BankAccountButton({super.key});

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
