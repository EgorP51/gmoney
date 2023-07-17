import 'package:flutter/material.dart';
import 'package:gmoney_app/core/ui/theme/gmoney_colors.dart';
import 'package:gmoney_app/core/ui/widgets/default_background.dart';
import 'package:gmoney_app/core/utils/app_size.dart';
import 'package:gmoney_app/features/password_recovery/presentation/widgets/password_change_input_widget.dart';

class PasswordChangeScreen extends StatelessWidget {
  const PasswordChangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          const DefaultBackground(),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Восстановить пароль'.toUpperCase(),
                    style: TextStyle(
                      color: context.gmoneyColors.whiteColor,
                      fontFamily: 'Circe',
                      fontSize: AppSize.itemWidth(context, 22),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const PasswordChangeInputWidget(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
