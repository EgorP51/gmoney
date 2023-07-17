import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gmoney_app/core/navigation/app_router.dart';
import 'package:gmoney_app/core/ui/theme/gmoney_colors.dart';
import 'package:gmoney_app/core/ui/widgets/gmoney_button.dart';
import 'package:gmoney_app/core/ui/widgets/gmoney_text_field.dart';
import 'package:gmoney_app/core/utils/app_size.dart';
import 'package:gmoney_app/features/password_recovery/domain/controllers/password_recovery_controller.dart';

class PasswordRecoveryInputWidget extends StatelessWidget {
  const PasswordRecoveryInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    PasswordRecoveryController controller =
    Get.find<PasswordRecoveryController>();

    return Form(
      key: controller.loginFormKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(
                () => GMoneyTextField(
              label: 'Введите E-mail',
              controller: controller.emailController,
              textInputType: TextInputType.emailAddress,
              isEmptyFieldValidation: controller.isEmailEmpty.value,
              validator: (value) => controller.emailValidator(value),
            ),
          ),
          Obx(
                () => GMoneyTextField(
              label: '+098765456789',
              controller: controller.phoneNumberController,
              textInputType: TextInputType.phone,
              isEmptyFieldValidation: controller.isPhoneEmpty.value,
              validator: (value) => controller.phoneNumberValidator(value),
            ),
          ),
          GMoneyTextField(
            label: 'Введите ваш ИИН',
            controller: controller.iinController,
            validator: (value) => controller.iinValidator(value),
          ),
          GMoneyButton(
            title: Text(
              'Восстановить пароль',
              style: TextStyle(
                color: context.gmoneyColors.whiteColor,
                fontFamily: 'Circe',
                fontSize: AppSize.itemHeight(context, 16),
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
            ),
            onPressed: () {
              controller.resetPassword();
              if (controller.canMoveToNextScreen) {
                AppRouter.navigateToPasswordChange();
              }
            },
          ),
        ],
      ),
    );
  }
}
