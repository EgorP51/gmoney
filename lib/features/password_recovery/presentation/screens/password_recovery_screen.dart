import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gmoney_app/core/ui/widgets/default_background.dart';
import 'package:gmoney_app/core/ui/widgets/gmoney_back_button.dart';
import 'package:gmoney_app/core/utils/app_size.dart';
import 'package:gmoney_app/features/password_recovery/domain/controllers/password_recovery_controller.dart';
import 'package:gmoney_app/features/password_recovery/presentation/widgets/password_recovery_input_widget.dart';
import 'package:gmoney_app/features/password_recovery/presentation/widgets/password_recovery_text_content.dart';

class PasswordRecoveryScreen extends StatelessWidget {
  const PasswordRecoveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PasswordRecoveryController controller =
        Get.put(PasswordRecoveryController());

    //TODO: удалить!
    if (kDebugMode) {
      controller.emailController.text = '64535ee@gmail.com';
      controller.phoneNumberController.text = '098745383';
      controller.iinController.text = '123456789098';
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            const DefaultBackground(withLogo: true),
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
                      PasswordRecoveryTextContent(),
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
