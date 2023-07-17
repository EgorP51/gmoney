import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gmoney_app/core/ui/theme/gmoney_colors.dart';
import 'package:gmoney_app/core/ui/widgets/gmoney_button.dart';
import 'package:gmoney_app/core/ui/widgets/gmoney_text_field.dart';
import 'package:gmoney_app/core/utils/app_size.dart';
import 'package:gmoney_app/features/authorization/domain/controllers/login_controller.dart';

class InputWidget extends GetView<LoginController> {
  const InputWidget({
    this.onTap,
    super.key,
  });

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.find<LoginController>();

    return Form(
      key: controller.loginFormKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(
            () => GMoneyTextField(
              onTap: onTap,
              label: 'Введите E-mail',
              controller: controller.emailController,
              textInputType: TextInputType.emailAddress,
              isEmptyFieldValidation: controller.isEmailEmpty.value,
              validator: (value) => controller.emailValidator(value),
            ),
          ),
          Obx(
            () => GMoneyTextField(
              onTap: onTap,
              label: '+098765456789',
              controller: controller.phoneNumberController,
              textInputType: TextInputType.phone,
              isEmptyFieldValidation: controller.isPhoneEmpty.value,
              validator: (value) => controller.phoneNumberValidator(value),
            ),
          ),
          GMoneyTextField(
            onTap: onTap,
            label: 'Введите пароль',
            controller: controller.passwordController,
            validator: (value) => controller.passwordValidator(value),
            obscureText: true,
          ),
          GMoneyButton(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/icons/enter_icon.svg"),
                const SizedBox(width: 5),
                Text(
                  'ВОЙТИ',
                  style: TextStyle(
                    color: context.gmoneyColors.whiteColor,
                    fontFamily: 'Circe',
                    fontSize: AppSize.itemHeight(context, 16),
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
            onPressed: () {
              controller.login();
              FocusScope.of(context).unfocus();
            },
          ),
        ],
      ),
    );
  }
}
