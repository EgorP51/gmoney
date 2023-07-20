import 'package:flutter/material.dart';
import 'package:gmoney_app/core/ui/theme/gmoney_text_styles.dart';
import 'package:gmoney_app/core/ui/widgets/default_background.dart';
import 'package:gmoney_app/core/ui/widgets/gmoney_back_button.dart';
import 'package:gmoney_app/core/utils/app_size.dart';
import 'package:gmoney_app/features/registration/contact_Information/presentation/widgets/contact_information_input_widget.dart';
import 'package:gmoney_app/core/ui/widgets/registration_progress_widget.dart';

class ContactInformationScreen extends StatelessWidget {
  const ContactInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
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
                child: Column(
                  children: [
                    Text('Регистрация'.toUpperCase(), style: context.gmoneyTextStyle.title),
                    const RegistrationProgressWidget(completedItemCount: 1,totalItemCount: 5),
                    Text('1. Контактная информация', style: context.gmoneyTextStyle.subtitle,),
                    const ContactInformationInputWidget(),
                  ],
                ),
              ),
            ),
          ),
          const GMoneyBackButton(),
        ],
      ),
    );
  }
}
