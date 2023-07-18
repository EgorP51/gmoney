import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gmoney_app/core/ui/widgets/gmoney_button.dart';
import 'package:gmoney_app/core/ui/widgets/gmoney_text_field.dart';
import 'package:gmoney_app/features/registration/contact_Information/domain/controllers/contact_information_controller.dart';

class ContactInformationInputWidget extends StatelessWidget {
  const ContactInformationInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ContactInformationController controller =
        Get.put(ContactInformationController());

    if (kDebugMode) {
      controller.iinController.text = '123456789098';
      controller.emailController.text = '54rege@gmail.com';
      controller.phoneNumberController.text = '0973577546';
    }

    return Form(
      key: controller.loginFormKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(
            () => GMoneyTextField(
              label: 'Введите ваш ИИН',
              controller: controller.iinController,
              isEmptyFieldValidation: controller.isIinEmpty.value,
              validator: (value) => controller.iinValidator(value),
            ),
          ),
          Obx(
            () => GMoneyTextField(
              label: 'Введите E-mail',
              controller: controller.emailController,
              textInputType: TextInputType.emailAddress,
              isEmptyFieldValidation: controller.isEmailEmpty.value,
              validator: (value) => controller.emailValidator(value),
            ),
          ),
          GMoneyTextField(
            label: '+098765456789',
            controller: controller.phoneNumberController,
            textInputType: TextInputType.phone,
            validator: (value) => controller.phoneNumberValidator(value),
          ),
          GMoneyButton(
            title: const Text('Далее'),
            onPressed: () {
              controller.confirmInformation();
            },
          ),
        ],
      ),
    );
  }
}
