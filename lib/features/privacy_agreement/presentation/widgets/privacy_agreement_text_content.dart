import 'package:flutter/material.dart';
import 'package:gmoney_app/core/ui/theme/gmoney_colors.dart';
import 'package:gmoney_app/core/utils/app_size.dart';

class PrivacyAgreementTextContent extends StatelessWidget {
  const PrivacyAgreementTextContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      child: Text(
        'Соглашение \nконфиденциальности',
        textAlign: TextAlign.start,
        maxLines: 2,
        style: TextStyle(
          color: context.gmoneyColors.whiteColor,
          fontFamily: 'Circe',
          fontSize: AppSize.itemWidth(context, 24),
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
