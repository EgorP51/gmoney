import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gmoney_app/core/ui/widgets/custom_dropdown.dart';
import 'package:gmoney_app/core/ui/widgets/gmoney_text_field.dart';
import 'package:gmoney_app/features/registration/bank_account/domain/controllers/bank_account_controller.dart';
import 'package:gmoney_app/features/registration/bank_account/presentation/widgets/issue_date_widget.dart';
import 'package:gmoney_app/features/registration/bank_account/presentation/widgets/validity_date_widget.dart';

class BankAccountInputWidget extends GetView<BankAccountController> {
  const BankAccountInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Obx(
          () => GMoneyTextField(
            label: 'KZ3647272646377236',
            controller: controller.bankAccountController,
            isEmptyFieldValidation: controller.isBankAccountEmpty.value,
            validator: (value) => controller.bankAccountValidator(value),
          ),
        ),
        Obx(
          () => GMoneyTextField(
            label: 'Номер удостоверения личности',
            controller: controller.idNumberController,
            textInputType: TextInputType.number,
            isEmptyFieldValidation: controller.isIDNumberEmpty.value,
            validator: (value) => controller.identityNumberValidator(value),
          ),
        ),
        Obx(() => IssueDateWidget(controller.isIssueDateEmpty.value)),
        Obx(() => ValidityDateWidget(controller.isValidityEmpty.value)),
        Obx(
          () => CustomDropdown(
            label: 'Орган выдачи',
            isEmptyFieldValidation: controller.isIssuingAuthorityEmpty.value,
            items: const [
              'МЮ РК',
              'МВД РК',
            ],
            validator: (value) => controller.issuingAuthorityValidator(value),
            controller: controller.issuingAuthorityController,
          ),
        ),
      ],
    );
  }
}
