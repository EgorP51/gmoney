import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gmoney_app/core/ui/theme/gmoney_text_styles.dart';
import 'package:gmoney_app/core/ui/widgets/default_background.dart';
import 'package:gmoney_app/core/ui/widgets/gmoney_back_button.dart';
import 'package:gmoney_app/core/ui/widgets/gmoney_logo.dart';
import 'package:gmoney_app/core/ui/widgets/registration_progress_widget.dart';
import 'package:gmoney_app/core/utils/app_size.dart';
import 'package:gmoney_app/features/registration/personal_data/domain/controllers/personal_data_controller.dart';
import 'package:gmoney_app/features/registration/personal_data/presentation/widgets/date_of_birth_picker_widget.dart';
import 'package:gmoney_app/features/registration/personal_data/presentation/widgets/full_name_input_widget.dart';
import 'package:gmoney_app/features/registration/personal_data/presentation/widgets/gender_selection_widget.dart';
import 'package:gmoney_app/features/registration/personal_data/presentation/widgets/marital_status_input_widget.dart';
import 'package:gmoney_app/features/registration/personal_data/presentation/widgets/personal_data_button.dart';
import 'package:gmoney_app/features/registration/personal_data/presentation/widgets/phone_input_field.dart';

class PersonalDataScreen extends StatelessWidget {
  const PersonalDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PersonalDataController controller = Get.put(PersonalDataController());
    return SafeArea(
      child: Stack(
        children: [
          const DefaultBackground(withLogo: false),
          Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                  top: 20, //AppSize.itemHeight(context, 60),
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Form(
                  key: controller.loginFormKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Align(
                            alignment: Alignment.topLeft,
                            child: GMoneyBackButton(),
                          ),
                          Container(
                            alignment: Alignment.topCenter,
                            child: GMoneyLogo(
                              height: AppSize.itemHeight(context, 42),
                            ),
                          ),
                        ],
                      ),
                      Text('Регистрация'.toUpperCase(),
                          style: context.gmoneyTextStyle.title),
                      const RegistrationProgressWidget(
                          completedItemCount: 2, totalItemCount: 5),
                      Text(
                        '2. Личные данные',
                        style: context.gmoneyTextStyle.subtitle,
                      ),
                      const FullNameInputWidget(),
                      const DateOfBirthPickerWidget(),
                      const GenderSelectionWidget(),
                      const MaritalStatusInputWidget(),
                      const PhoneInputField(),
                      const PersonalDataButton(),
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
