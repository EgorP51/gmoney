import 'package:flutter/material.dart';
import 'package:gmoney_app/core/ui/theme/gmoney_text_styles.dart';
import 'package:gmoney_app/core/ui/widgets/registration_progress_widget.dart';

class BankAccountTextWidget extends StatelessWidget {
  const BankAccountTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Регистрация'.toUpperCase(), style: context.gmoneyTextStyle.title),
        const RegistrationProgressWidget(
            completedItemCount: 5, totalItemCount: 5),
        Text(
          '5. Банковский счет',
          style: context.gmoneyTextStyle.subtitle,
        ),
      ],
    );
  }
}
