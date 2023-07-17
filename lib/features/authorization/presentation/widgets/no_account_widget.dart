import 'package:flutter/material.dart';
import 'package:gmoney_app/core/ui/theme/gmoney_colors.dart';
import 'package:gmoney_app/core/utils/app_size.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Text(
        'Нет аккаунта?',
        style: TextStyle(
          fontFamily: 'Circe',
          fontSize: AppSize.itemHeight(context, 16),
          fontWeight: FontWeight.w700,
          color: context.gmoneyColors.whiteColor,
        ),
      ),
    );
  }
}