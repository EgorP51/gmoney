import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gmoney_app/core/navigation/app_router.dart';
import 'package:gmoney_app/core/ui/widgets/gmoney_button.dart';
import 'package:gmoney_app/core/ui/widgets/gmoney_text_field.dart';
import 'package:gmoney_app/features/password_recovery/domain/controllers/password_change_controller.dart';

class PasswordChangeInputWidget extends GetView<PasswordChangeController> {
  const PasswordChangeInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    PasswordChangeController controller = Get.put(PasswordChangeController());

    //TODO: удалить!
    if (kDebugMode) {
      controller.passwordController.text = '64Rr#tt2';
      controller.passwordRepeaterController.text = '64Rr#tt2';
    }

    return Form(
      key: controller.loginFormKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GMoneyTextField(
            label: 'Введите новый пароль',
            controller: controller.passwordController,
            validator: (value) => controller.passwordValidator(value),
          ),
          GMoneyTextField(
            label: 'Повторите новый пароль',
            controller: controller.passwordRepeaterController,
            validator: (value) => controller.passwordRepeaterValidator(value),
          ),
          GMoneyButton(
            title: const Text('Сохранить'),
            onPressed: () {
              controller.changePassword();
              if (controller.canMoveToNextScreen) {
                Get.dialog(
                  AlertDialog(
                    title: Center(
                        child: SvgPicture.asset("assets/icons/group.svg")),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                    ),
                    content: const Text(
                      "Новый пароль успешно сохранен",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF05B460),
                        height: 1.2,
                      ),
                    ),
                  ),
                );
                Future.delayed(
                  const Duration(seconds: 1),
                  () {
                    Get.back();
                    AppRouter.navigateToAuthorization();
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
