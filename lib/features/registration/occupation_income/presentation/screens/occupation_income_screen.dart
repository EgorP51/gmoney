import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gmoney_app/core/ui/widgets/default_background.dart';
import 'package:gmoney_app/core/ui/widgets/default_top_widget.dart';
import 'package:gmoney_app/features/registration/occupation_income/domain/controllers/occupation_income_controller.dart';
import 'package:gmoney_app/features/registration/occupation_income/presentation/widgets/asp_recipient_widget.dart';
import 'package:gmoney_app/features/registration/occupation_income/presentation/widgets/income_and_employment_input.dart';
import 'package:gmoney_app/features/registration/occupation_income/presentation/widgets/job_position_selector.dart';
import 'package:gmoney_app/features/registration/occupation_income/presentation/widgets/minor_children_selector.dart';
import 'package:gmoney_app/features/registration/occupation_income/presentation/widgets/occupation_income_button.dart';
import 'package:gmoney_app/features/registration/occupation_income/presentation/widgets/occupation_income_text_widget.dart';

class OccupationIncomeScreen extends StatelessWidget {
  const OccupationIncomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OccupationIncomeController controller = Get.put(OccupationIncomeController());

    if (kDebugMode) {
      controller.aspRecipientController.text = 'Да';
      controller.averageMonthlyIncomeController.text = '4';
      controller.additionalMonthlyIncomeController.text = '4';
      controller.workPlaceController.text = 'Работа с дома';
      controller.jobPositionController.text = 'Рабочий';
      controller.minorChildrenController.text = '0';
    }
    
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
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Form(
                  key: controller.occupationIncomeFormKey,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      DefaultTopWidget(),
                      OccupationIncomeTextWidget(),
                      AspRecipientWidget(),
                      IncomeAndEmploymentInput(),
                      JobPositionSelector(),
                      MinorChildrenSelector(),
                      OccupationIncomeButton(),
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
