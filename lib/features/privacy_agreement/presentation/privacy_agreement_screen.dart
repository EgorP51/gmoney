import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gmoney_app/core/ui/theme/gmoney_colors.dart';
import 'package:gmoney_app/core/ui/widgets/default_background.dart';
import 'package:gmoney_app/core/ui/widgets/gmoney_back_button.dart';
import 'package:gmoney_app/core/ui/widgets/gmoney_button.dart';
import 'package:gmoney_app/core/utils/app_size.dart';
import 'package:gmoney_app/features/privacy_agreement/domain/controllers/privacy_agreement_controller.dart';
import 'package:gmoney_app/features/privacy_agreement/presentation/widgets/policy_confirmation_widget.dart';
import 'package:gmoney_app/features/privacy_agreement/presentation/widgets/privacy_agreement_info_widget.dart';
import 'package:gmoney_app/features/privacy_agreement/presentation/widgets/privacy_agreement_text_content.dart';

class PrivacyAgreementScreen extends StatelessWidget {
  PrivacyAgreementScreen({super.key});

  final PrivacyAgreementController privacyAgreementController =
      Get.put(PrivacyAgreementController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          const DefaultBackground(),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: EdgeInsets.only(top: AppSize.itemHeight(context, 60)),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const PrivacyAgreementTextContent(),
                    const PrivacyAgreementInfoWidget(),
                    PolicyConfirmationWidget(),
                    SizedBox(height: AppSize.itemHeight(context, 10)),
                    Obx(
                      () => GMoneyButton(
                        title: Text(
                          'продолжить'.toUpperCase(),
                          style: TextStyle(
                            color: context.gmoneyColors.whiteColor,
                            fontFamily: 'Circe',
                            fontSize: AppSize.itemHeight(context, 16),
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5,
                          ),
                        ),
                        enabled: privacyAgreementController.enabled.value,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const GMoneyBackButton(),
        ],
      ),
    );
  }
}
