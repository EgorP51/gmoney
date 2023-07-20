import 'package:flutter/material.dart';
import 'package:gmoney_app/core/ui/theme/gmoney_text_styles.dart';
import 'package:gmoney_app/core/ui/widgets/registration_progress_widget.dart';

class OccupationIncomeTextWidget extends StatelessWidget {
  const OccupationIncomeTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Регистрация'.toUpperCase(), style: context.gmoneyTextStyle.title),
        const RegistrationProgressWidget(
            completedItemCount: 3, totalItemCount: 5),
        Text(
          '3. Занятость и доходы',
          style: context.gmoneyTextStyle.subtitle,
        ),
      ],
    );
  }
}
