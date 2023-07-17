import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gmoney_app/core/ui/theme/gmoney_colors.dart';
import 'package:gmoney_app/core/utils/app_size.dart';
import 'package:gmoney_app/features/privacy_agreement/domain/controllers/privacy_agreement_controller.dart';

class PolicyConfirmationWidget extends StatelessWidget {
  PolicyConfirmationWidget({super.key});

  final PrivacyAgreementController privacyAgreementController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Obx(
          () => GestureDetector(
            onTap: () {
              privacyAgreementController.toggleCheckbox();
            },
            child: Container(
              width: AppSize.itemHeight(context, 23),
              height: AppSize.itemHeight(context, 23),
              margin: const EdgeInsets.only(left: 16, right: 8),
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: context.gmoneyColors.whiteColor,
              ),
              child: privacyAgreementController.enabled.value
                  ? SvgPicture.asset("assets/icons/check.svg")
                  : null,
            ),
          ),
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: 'C ',
                style: TextStyle(
                  color: context.gmoneyColors.whiteColor,
                  fontFamily: "Circe",
                  fontWeight: FontWeight.w300,
                  fontSize: AppSize.itemWidth(context, 14),
                ),
              ),
              TextSpan(
                text: 'Политикой конфиденциальности',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: context.gmoneyColors.magentaTextColor,
                  fontFamily: "Circe",
                  fontWeight: FontWeight.w300,
                  fontSize: AppSize.itemWidth(context, 14),
                ),
              ),
              TextSpan(
                text: ' ознакомлен',
                style: TextStyle(
                  color: context.gmoneyColors.whiteColor,
                  fontFamily: "Circe",
                  fontWeight: FontWeight.w300,
                  fontSize: AppSize.itemWidth(context, 14),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
