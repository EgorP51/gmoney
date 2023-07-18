import 'package:flutter/material.dart';
import 'package:gmoney_app/core/ui/theme/gmoney_colors.dart';
import 'package:gmoney_app/core/utils/app_size.dart';

extension GMoneyTextStyleExtension on BuildContext {
  GMoneyTextStyles get gmoneyTextStyle => GMoneyTextStyles(this);
}

class GMoneyTextStyles {
  GMoneyTextStyles(this.context);

  final BuildContext context;

  TextStyle get title => TextStyle(
        color: context.gmoneyColors.whiteColor,
        fontFamily: 'Circe',
        fontSize: AppSize.itemHeight(context, 24),
        fontWeight: FontWeight.w800,
      );

  TextStyle get subtitle => TextStyle(
        color: context.gmoneyColors.whiteColor,
        fontFamily: 'Circe',
        fontSize: AppSize.itemHeight(context, 20),
        fontWeight: FontWeight.w600,
      );

  TextStyle get small => TextStyle(
        color: context.gmoneyColors.whiteColor,
        fontFamily: 'Circe',
        fontSize: AppSize.itemHeight(context, 16),
        fontWeight: FontWeight.w400,
      );
}
