import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gmoney_app/core/navigation/app_router.dart';
import 'package:gmoney_app/core/ui/theme/gmoney_colors.dart';
import 'package:gmoney_app/core/ui/widgets/default_background.dart';
import 'package:gmoney_app/core/ui/widgets/gmoney_button.dart';
import 'package:gmoney_app/core/ui/widgets/gmoney_text_field.dart';
import 'package:gmoney_app/core/utils/app_size.dart';

class PasswordChangeController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();

  final passwordController = TextEditingController();
  final passwordRepeaterController = TextEditingController();

  var isPasswordEmpty = false.obs;
  var isPasswordRepeaterEmpty = false.obs;

  var canMoveToNextScreen = false;

  @override
  void onClose() {
    passwordController.dispose();
    passwordRepeaterController.dispose();
    super.onClose();
  }

  String? passwordValidator(String? value) {
    // TODO: убрать из регулярки большие буквы!
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

    if ((value == null || value.isEmpty) || !regex.hasMatch(value)) {
      return 'Поле должно состоять из символов на латинице, спецсимволов и цифр';
    } else {
      return null;
    }
  }

  String? passwordRepeaterValidator(String? value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

    if ((value == null || value.isEmpty) &&
        passwordController.text.isEmpty &&
        passwordRepeaterController.text.isEmpty) {
      isPasswordEmpty.value = true;
      isPasswordRepeaterEmpty.value = true;

      return 'Данные поля являются обязательными для заполнения';
    } else if (!regex.hasMatch(value!)) {
      return 'Поле должно состоять из символов на латинице, спецсимволов и цифр';
    } else if (passwordController.text != passwordRepeaterController.text) {
      return 'Пароли должны совпадать';
    }

    return null;
  }

  void changePassword() {
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
      canMoveToNextScreen = true;
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

class PasswordChangeScreen extends StatelessWidget {
  const PasswordChangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          DefaultBackground(),
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
                  InputWidget(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class InputWidget extends GetView<PasswordChangeController> {
  const InputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    PasswordChangeController controller = Get.put(PasswordChangeController());

    /*//TODO: удалить!
    if (kDebugMode) {
      controller.passwordController.text = '64Rr#tt2';
      controller.passwordRepeaterController.text = '64Rr#tt2';
    }*/

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
                        height: 1.2
                      ),
                    ),
                  ),
                );
                Future.delayed(const Duration(seconds: 1), () {
                  Get.back();
                  AppRouter.navigateToAuthorization();
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
