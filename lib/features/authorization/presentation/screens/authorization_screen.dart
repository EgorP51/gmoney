import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gmoney_app/core/ui/theme/gmoney_colors.dart';
import 'package:gmoney_app/core/ui/widgets/gmoney_logo.dart';
import 'package:gmoney_app/core/utils/app_size.dart';
import 'package:gmoney_app/features/authorization/domain/controllers/background_controller.dart';
import 'package:gmoney_app/features/authorization/domain/controllers/foreground_controller.dart';
import 'package:gmoney_app/features/authorization/presentation/widgets/authorization_text.dart';
import 'package:gmoney_app/features/authorization/presentation/widgets/forgot_password_text.dart';
import 'package:gmoney_app/features/authorization/presentation/widgets/input_widget.dart';
import 'package:gmoney_app/features/authorization/presentation/widgets/no_account_widget.dart';
import 'package:gmoney_app/features/authorization/presentation/widgets/registration_button.dart';

final List<Widget> initialDecoration = [
  Align(
    alignment: Alignment.topCenter,
    child: Image.asset(
      'assets/img/decoration/authorization_background_center.png',
      fit: BoxFit.cover,
      width: double.infinity,
    ),
  ),
  Align(
    alignment: const Alignment(1, 0.5),
    child: Image.asset(
      'assets/img/decoration/authorization_background_right.png',
      fit: BoxFit.cover,
    ),
  ),
];

final List<Widget> validationDecoration = [
  Align(
    alignment: Alignment.topLeft,
    child: Image.asset(
      'assets/img/decoration/authorization_background_left.png',
      fit: BoxFit.cover,
    ),
  ),
  Align(
    alignment: Alignment.bottomRight,
    child: Image.asset(
      'assets/img/decoration/authorization_background_right.png',
      fit: BoxFit.cover,
    ),
  ),
];

class AuthorizationScreen extends StatelessWidget {
  const AuthorizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BackgroundController backgroundController =
        Get.put(BackgroundController());
    final ForegroundController foregroundController =
        Get.put(ForegroundController());

    onTapForeground() {
      backgroundController.toggleBackground();
      foregroundController.toggleForeground();
      FocusScope.of(context).unfocus();
    }

    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: context.gmoneyColors.backgroundColor,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            GetBuilder<BackgroundController>(
              builder: (controller) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                  child: controller.isValidation.value
                      ? Background(
                          decoration: validationDecoration,
                          key: const ValueKey<int>(0),
                        )
                      : Background(
                          decoration: initialDecoration,
                          key: const ValueKey<int>(1),
                        ),
                );
              },
            ),
            Foreground(
              controller: foregroundController,
              onTap: onTapForeground,
            )
          ],
        ),
      ),
    );
  }
}

class Foreground extends StatelessWidget {
  const Foreground({
    required this.controller,
    this.onTap,
    super.key,
  });

  final void Function()? onTap;
  final ForegroundController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(height: AppSize.itemHeight(context, 70)),
        Obx(
          () => AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
            //TODO: вынести в отдельный метод!
            height: !controller.isValidation.value
                ? AppSize.itemHeight(context, 210)
                : AppSize.itemHeight(
                    context,
                    controller.isKeyboardVisible.value
                        ? AppSize.itemHeight(context, 20)
                        : AppSize.itemHeight(context, 110)),
            child: !controller.isValidation.value
                ? const TopWidget()
                : const SizedBox(),
          ),
        ),
        SizedBox(height: AppSize.itemHeight(context, 8)),
        const AuthorizationText(),
        SizedBox(height: AppSize.itemHeight(context, 10)),
        InputWidget(onTap: onTap),
        const ForgotPasswordText(),
        const Spacer(),
        const NoAccountText(),
        const RegistrationButton()
      ],
    );
  }
}

class TopWidget extends StatelessWidget {
  const TopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.itemHeight(context, 210),
      child: Image.asset(
        'assets/img/decoration/authorization_image.png',
      ),
    );
  }
}

class Background extends StatelessWidget {
  const Background({
    required this.decoration,
    super.key,
  });

  final List<Widget> decoration;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: context.gmoneyColors.backgroundColor,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SvgPicture.asset(
              "assets/img/background/authorization_background.svg",
              fit: BoxFit.cover,
            ),
          ),
          ...decoration,
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(top: AppSize.itemHeight(context, 20)),
            child: GMoneyLogo(
              height: AppSize.itemHeight(context, 42),
            ),
          ),
        ],
      ),
    );
  }
}
