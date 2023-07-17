import 'package:flutter/material.dart';
import 'package:gmoney_app/core/ui/theme/gmoney_colors.dart';
import 'package:gmoney_app/core/utils/app_size.dart';

class AuthorizationText extends StatelessWidget {
  const AuthorizationText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'АВТОРИЗАЦИЯ',
      style: TextStyle(
        color: context.gmoneyColors.whiteColor,
        fontFamily: 'Circe',
        fontSize: AppSize.itemHeight(context, 24),
        fontWeight: FontWeight.w800,
      ),
    );
  }
}