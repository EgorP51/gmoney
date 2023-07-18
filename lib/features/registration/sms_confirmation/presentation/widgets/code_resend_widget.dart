import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gmoney_app/core/ui/theme/gmoney_colors.dart';
import 'package:gmoney_app/core/ui/theme/gmoney_text_styles.dart';
import 'package:gmoney_app/features/registration/sms_confirmation/domain/controllers/registration_controller.dart';

class CodeResendWidget extends StatelessWidget {
  final RegistrationController _controller = Get.put(RegistrationController());

  CodeResendWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Выслать код повторно через: ',
              style: context.gmoneyTextStyle.small,
            ),
            Obx(
                  () => Text(
                '00:${_controller.countdown.value}',
                style: context.gmoneyTextStyle.small.copyWith(
                  color: context.gmoneyColors.buttonColor,
                ),
              ),
            ),
          ],
        ),
        Obx(
              () => _controller.countdown.value == 0
              ? TextButton(
            onPressed: _controller.resendCode,
            child: Text(
              'Отправить код повторно',
              style: context.gmoneyTextStyle.small.copyWith(
                color: context.gmoneyColors.magentaTextColor,
                decoration: TextDecoration.underline,
                decorationThickness: 1,
                decorationColor: context.gmoneyColors.magentaTextColor,
              ),
            ),
          )
              : const SizedBox(),
        ),
      ],
    );
  }
}
