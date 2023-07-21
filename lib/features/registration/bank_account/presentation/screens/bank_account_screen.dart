import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gmoney_app/core/ui/widgets/default_background.dart';
import 'package:gmoney_app/core/ui/widgets/default_top_widget.dart';
import 'package:gmoney_app/features/registration/bank_account/domain/controllers/bank_account_controller.dart';
import 'package:gmoney_app/features/registration/bank_account/presentation/widgets/bank_account_button.dart';
import 'package:gmoney_app/features/registration/bank_account/presentation/widgets/bank_account_input_widget.dart';
import 'package:gmoney_app/features/registration/bank_account/presentation/widgets/bank_account_text_widget.dart';

class BankAccountScreen extends StatelessWidget {
  const BankAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
   BankAccountController controller = Get.put(BankAccountController());
    return SafeArea(
      child: Stack(
        children: [
          const DefaultBackground(withLogo: false),
          Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: Align(
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                  top: 20,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 16,
                ),
                child: Form(
                  key: controller.bankAccountFormKey,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      DefaultTopWidget(),
                      BankAccountTextWidget(),
                      BankAccountInputWidget(),
                      BankAccountButton(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
