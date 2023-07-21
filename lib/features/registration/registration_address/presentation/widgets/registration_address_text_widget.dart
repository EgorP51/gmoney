import 'package:flutter/material.dart';
import 'package:gmoney_app/core/ui/theme/gmoney_text_styles.dart';
import 'package:gmoney_app/core/ui/widgets/registration_progress_widget.dart';

class RegistrationAddressTextWidget extends StatelessWidget {
  const RegistrationAddressTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Регистрация'.toUpperCase(), style: context.gmoneyTextStyle.title),
        const RegistrationProgressWidget(
            completedItemCount: 4, totalItemCount: 5),
        Text(
          '4. Адрес регистрации',
          style: context.gmoneyTextStyle.subtitle,
        ),
      ],
    );
  }
}
