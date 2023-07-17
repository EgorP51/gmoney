import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gmoney_app/core/navigation/app_router.dart';
import 'package:gmoney_app/core/ui/theme/gmoney_colors.dart';
import 'package:gmoney_app/core/ui/widgets/default_background.dart';
import 'package:gmoney_app/core/ui/widgets/gmoney_back_button.dart';
import 'package:gmoney_app/core/ui/widgets/gmoney_button.dart';
import 'package:gmoney_app/core/ui/widgets/gmoney_text_field.dart';
import 'package:gmoney_app/core/utils/app_size.dart';

//TODO: ОТРЕФАКТОРИТЬ!!!!!!!!!!!!!!!!!!!!!!

class PasswordRecoveryController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final iinController = TextEditingController();

  var isEmailEmpty = false.obs;
  var isPhoneEmpty = false.obs;
  var canMoveToNextScreen = false;

  @override
  void onClose() {
    emailController.dispose();
    phoneNumberController.dispose();
    iinController.dispose();
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

  String? iinValidator(String? value) {
    RegExp regex = RegExp(r'^\d{12}$');

    if ((value == null || value.isEmpty) &&
        emailController.text.isEmpty &&
        phoneNumberController.text.isEmpty) {
      isEmailEmpty.value = true;
      isPhoneEmpty.value = true;

      return 'Данные поля являются обязательными для заполнения';
    } else {
      if (!regex.hasMatch(value!)) {
        return 'Поле должно соответствовать формату';
      }
    }
    return null;
  }

  void resetPassword() {
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

class PasswordRecoveryScreen extends StatelessWidget {
  const PasswordRecoveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PasswordRecoveryController controller =
        Get.put(PasswordRecoveryController());

    /*//TODO: удалить!
    if (kDebugMode) {
      controller.emailController.text = '64535ee@gmail.com';
      controller.phoneNumberController.text = '098745383';
      controller.iinController.text = '123456789098';
    }*/

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            const DefaultBackground(),
            Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.transparent,
              body: Center(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                    top: AppSize.itemHeight(context, 60),
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextContent(),
                      PasswordRecoveryInputWidget(),
                    ],
                  ),
                ),
              ),
            ),
            const GMoneyBackButton(),
          ],
        ),
      ),
    );
  }
}

class TextContent extends StatelessWidget {
  const TextContent({super.key});

  static const _lightText = TextStyle(
    color: Colors.white,
    fontFamily: 'Circe',
    fontWeight: FontWeight.w100,
    fontSize: 14,
    height: 1.2,
  );
  static const _boldText = TextStyle(
      color: Colors.white,
      fontFamily: 'Circe',
      fontWeight: FontWeight.w900,
      fontSize: 14,
      height: 1);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Восстановить пароль'.toUpperCase(),
          style: TextStyle(
            color: context.gmoneyColors.whiteColor,
            fontFamily: 'Circe',
            fontSize: AppSize.itemHeight(context, 24),
            fontWeight: FontWeight.w800,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 16,
          ),
          child: RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: 'Для восстановления пароля введите ваш ',
                    style: _lightText),
                TextSpan(text: 'номер мобильного телефона', style: _boldText),
                TextSpan(text: ' или ', style: _lightText),
                TextSpan(text: 'электронную почту', style: _boldText),
                TextSpan(
                    text: ', которую вы указали при регистрации, ',
                    style: _lightText),
                TextSpan(text: 'введите ИИН', style: _boldText),
                TextSpan(
                    text: ' и нажмите на восстановить пароль',
                    style: _lightText),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

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
