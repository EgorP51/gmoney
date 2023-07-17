import 'package:flutter/material.dart';
import 'package:gmoney_app/core/navigation/app_router.dart';
import 'package:gmoney_app/core/ui/theme/gmoney_colors.dart';
import 'package:gmoney_app/core/utils/app_size.dart';

class ForgotPasswordText extends StatelessWidget {
  const ForgotPasswordText({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppRouter.navigateToPasswordRecovery();
      },
      child: Text(
        'Забыли пароль?',
        style: TextStyle(
          fontFamily: 'Circe',
          fontSize: AppSize.itemHeight(context, 16),
          fontWeight: FontWeight.w700,
          color: context.gmoneyColors.magentaTextColor,
          decoration: TextDecoration.underline,
          decorationColor: context.gmoneyColors.magentaTextColor,
        ),
      ),
    );
  }
}
