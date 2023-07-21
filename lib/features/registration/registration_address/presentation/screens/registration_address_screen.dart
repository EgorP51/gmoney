import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gmoney_app/core/ui/widgets/default_background.dart';
import 'package:gmoney_app/core/ui/widgets/default_top_widget.dart';
import 'package:gmoney_app/features/registration/registration_address/domain/controllers/registration_address_controller.dart';
import 'package:gmoney_app/features/registration/registration_address/presentation/widgets/additional_contact_button.dart';
import 'package:gmoney_app/features/registration/registration_address/presentation/widgets/additional_contact_text.dart';
import 'package:gmoney_app/features/registration/registration_address/presentation/widgets/additional_contact_widget.dart';
import 'package:gmoney_app/features/registration/registration_address/presentation/widgets/address_input_widget.dart';
import 'package:gmoney_app/features/registration/registration_address/presentation/widgets/region_selection_widget.dart';
import 'package:gmoney_app/features/registration/registration_address/presentation/widgets/registration_address_text_widget.dart';

class RegistrationAddressScreen extends StatelessWidget {
  const RegistrationAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RegistrationAddressController controller =
        Get.put(RegistrationAddressController());

    if (kDebugMode) {
      controller.regionController.text = 'Акмолинская область';
      controller.localityController.text = 'Зеленодольск';
      controller.streetController.text = 'Слорп';
      controller.houseController.text = '1';
      controller.apartmentController.text = '3';
      controller.nameController.text = 'Марк';
      controller.surnameController.text = 'Давопр';
      controller.kinshipController.text = 'Домашний';
      controller.phoneController.text = '7834253722';
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
                  bottom: MediaQuery.of(context).viewInsets.bottom + 16,
                ),
                child: Form(
                  key: controller.addressFormKey,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      DefaultTopWidget(),
                      RegistrationAddressTextWidget(),
                      RegionSelectionWidget(),
                      AddressInputWidget(),
                      AdditionalContactText(),
                      AdditionalContactWidget(),
                      RegistrationAddressButton(),
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
