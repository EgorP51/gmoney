import 'package:flutter/material.dart';
import 'package:gmoney_app/core/ui/theme/gmoney_text_styles.dart';
import 'package:gmoney_app/core/ui/widgets/registration_progress_widget.dart';

class PersonalDataTextWidget extends StatelessWidget {
  const PersonalDataTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Регистрация'.toUpperCase(),
            style: context.gmoneyTextStyle.title),
        const RegistrationProgressWidget(
            completedItemCount: 2, totalItemCount: 5),
        Text(
          '2. Личные данные',
          style: context.gmoneyTextStyle.subtitle,
        ),
      ],
    );
  }
}
