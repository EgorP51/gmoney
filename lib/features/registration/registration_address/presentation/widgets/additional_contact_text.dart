import 'package:flutter/material.dart';
import 'package:gmoney_app/core/ui/theme/gmoney_text_styles.dart';

class AdditionalContactText extends StatelessWidget {
  const AdditionalContactText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text('Дополнительный контакт',
            style: context.gmoneyTextStyle.small),
      ),
    );
  }
}
