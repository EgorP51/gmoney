import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gmoney_app/core/ui/theme/gmoney_colors.dart';
import 'package:gmoney_app/core/ui/widgets/gmoney_button.dart';
import 'package:gmoney_app/core/ui/widgets/gmoney_text_field.dart';
import 'package:gmoney_app/core/utils/app_size.dart';

class LoginController extends GetxController {
  final  loginFormKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();

  var isEmailEmpty = false.obs;
  var isPhoneEmpty = false.obs;

  @override
  void onClose() {
    emailController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
    } else {
      if (!GetUtils.isEmail(value)) {
        return 'Поле должно состоять из символов на латинице, спецсимволов и цифр';
      }
    }
    return null;
  }

  String? phoneNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
    } else {
      if (!GetUtils.isPhoneNumber(value)) {
        return 'Поле должно состоять из цифр и содержать 10 цифр';
      }
    }
    return null;
  }

  String? passwordValidator(String? value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

    if ((value == null || value.isEmpty) &&
        emailController.text.isEmpty &&
        phoneNumberController.text.isEmpty) {
      isEmailEmpty.value = true;
      isPhoneEmpty.value = true;

      return 'Данные поля являются обязательными для заполнения';
    } else {
      if (!regex.hasMatch(value!)) {
        return 'Поле должно состоять из символов на латинице, спецсимволов и цифр';
      }
    }
    return null;
  }

  void login() {
    if (loginFormKey.currentState == null) {
      Get.snackbar(
        'Форма не прош nenfff!',
        'Вообще не прошла',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
      );
      return;
    }
    final isValid = loginFormKey.currentState!.validate();
    if (isValid) {
      Get.snackbar(
        'Форма прошла валидацию!',
        'Прям реально прошла',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
      );
    } else {
      Get.snackbar(
        'Форма не прошла валидацию!',
        'Вообще не прошла',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
      );
    }
    loginFormKey.currentState!.save();
  }
}

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
              onTap: () {
                onTap!();
                //todo: пора так, потом посмотрим
               // controller.loginFormKey.currentState!.validate();
              },
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
