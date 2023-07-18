import 'package:flutter/material.dart';
import 'package:gmoney_app/core/ui/theme/gmoney_text_styles.dart';
import 'package:gmoney_app/features/registration/sms_confirmation/presentation/widgets/code_resend_widget.dart';
import 'package:gmoney_app/features/registration/sms_confirmation/presentation/widgets/sms_confirmation_text_field.dart';

class SmsConfirmationWidget extends StatelessWidget {
  const SmsConfirmationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Введите код из смс',
          style: context.gmoneyTextStyle.subtitle,
        ),
        const CustomTextField(),
        CodeResendWidget(),
      ],
    );
  }
}
