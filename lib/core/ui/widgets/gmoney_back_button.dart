import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gmoney_app/core/navigation/app_router.dart';
import 'package:gmoney_app/core/ui/theme/gmoney_colors.dart';
import 'package:gmoney_app/core/utils/app_size.dart';

class GMoneyBackButton extends StatelessWidget {
  const GMoneyBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
        onPressed: () {
          print('shit');
          AppRouter.navigateBack();
        },
        icon: Container(
          width: AppSize.itemHeight(context, 42),
          height: AppSize.itemHeight(context, 42),
          margin: const EdgeInsets.only(top: 12, left: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: context.gmoneyColors.buttonColor,
          ),
          padding: const EdgeInsets.all(8),
          child: SvgPicture.asset("assets/icons/arrow_back.svg"),
        ),
      ),
    );
  }
}
