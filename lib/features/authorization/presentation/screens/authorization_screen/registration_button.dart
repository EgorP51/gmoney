import 'package:flutter/cupertino.dart';
import 'package:gmoney_app/core/navigation/app_router.dart';
import 'package:gmoney_app/core/ui/theme/gmoney_colors.dart';
import 'package:gmoney_app/core/utils/app_size.dart';

class RegistrationButton extends StatelessWidget {
  const RegistrationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: AppSize.itemHeight(context, 16),
        top: AppSize.itemHeight(context, 8),
      ),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: context.gmoneyColors.buttonColor.withOpacity(0.35),
              offset: const Offset(0, 16),
              blurRadius: 44,
            ),
          ],
        ),
        height: AppSize.itemHeight(context, 60),
        width: AppSize.itemWidth(context, 240),
        child: CupertinoButton(
          padding: const EdgeInsets.all(0),
          onPressed: () {
            AppRouter.navigateTopPrivacyAgreement();
          },
          color: context.gmoneyColors.whiteColor,
          borderRadius: BorderRadius.circular(12),
          child: Text(
            'Зарегистрироваться',
            maxLines: 1,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Circe',
              color: context.gmoneyColors.buttonColor,
              fontSize: AppSize.itemHeight(context, 20),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
