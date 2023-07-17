import 'package:flutter/material.dart';
import 'package:gmoney_app/core/ui/theme/gmoney_colors.dart';
import 'package:gmoney_app/core/utils/app_size.dart';

class PasswordRecoveryTextContent extends StatelessWidget {
  const PasswordRecoveryTextContent({super.key});

  static const _lightText = TextStyle(
    color: Colors.white,
    fontFamily: 'Circe',
    fontWeight: FontWeight.w100,
    fontSize: 14,
    height: 1.2,
  );
  static const _boldText = TextStyle(
      color: Colors.white,
      fontFamily: 'Circe',
      fontWeight: FontWeight.w900,
      fontSize: 14,
      height: 1);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Восстановить пароль'.toUpperCase(),
          style: TextStyle(
            color: context.gmoneyColors.whiteColor,
            fontFamily: 'Circe',
            fontSize: AppSize.itemHeight(context, 24),
            fontWeight: FontWeight.w800,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 16,
          ),
          child: RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: 'Для восстановления пароля введите ваш ',
                    style: _lightText),
                TextSpan(text: 'номер мобильного телефона', style: _boldText),
                TextSpan(text: ' или ', style: _lightText),
                TextSpan(text: 'электронную почту', style: _boldText),
                TextSpan(
                    text: ', которую вы указали при регистрации, ',
                    style: _lightText),
                TextSpan(text: 'введите ИИН', style: _boldText),
                TextSpan(
                    text: ' и нажмите на восстановить пароль',
                    style: _lightText),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
