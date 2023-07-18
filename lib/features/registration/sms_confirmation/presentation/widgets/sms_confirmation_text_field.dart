import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gmoney_app/core/ui/theme/gmoney_colors.dart';
import 'package:gmoney_app/core/ui/theme/gmoney_text_styles.dart';
import 'package:gmoney_app/core/utils/app_size.dart';
import 'package:gmoney_app/features/registration/sms_confirmation/domain/controllers/sms_confirmation_controller.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomTextField extends GetView<SmsConfirmationController> {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    SmsConfirmationController controller = Get.put(SmsConfirmationController());

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSize.itemWidth(context, 28),
        vertical: AppSize.itemWidth(context, 16),
      ),
      child: PinCodeTextField(
        length: 6,
        obscureText: false,
        keyboardType: TextInputType.phone,
        textStyle: context.gmoneyTextStyle.subtitle,
        animationType: AnimationType.fade,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(12),
          fieldHeight: AppSize.itemWidth(context, 60),
          fieldWidth: AppSize.itemWidth(context, 41),
          activeFillColor: context.gmoneyColors.buttonColor,
          activeColor: context.gmoneyColors.buttonColor,
          selectedColor: context.gmoneyColors.buttonColor,
          inactiveColor: context.gmoneyColors.textFieldColor,
          inactiveFillColor: context.gmoneyColors.textFieldColor,
          selectedFillColor: context.gmoneyColors.buttonColor,
        ),
        enableActiveFill: true,
        controller: controller.textEditingController,
        onCompleted: (value) {
          controller.checkCode(value);
        },
        onChanged: (value) {
          controller.onChanged(value);
        },
        beforeTextPaste: (text) {
          return true;
        },
        appContext: context,
      ),
    );
  }
}
