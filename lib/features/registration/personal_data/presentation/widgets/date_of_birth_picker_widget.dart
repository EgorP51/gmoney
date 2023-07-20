import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gmoney_app/core/ui/widgets/gmoney_text_field.dart';
import 'package:gmoney_app/features/registration/personal_data/domain/controllers/personal_data_controller.dart';
import 'package:gmoney_app/features/registration/personal_data/presentation/widgets/custom_calendar.dart';

class DateOfBirthPickerWidget extends GetView<PersonalDataController> {
  const DateOfBirthPickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GMoneyTextField(
          label: 'Дата рождения',
          controller: controller.dateOfBirthController,
          isEmptyFieldValidation: controller.isDateOfBirthEmpty.value,
          validator: (value) =>  controller.dateValidator(value),
          suffixIcon: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              controller.toggleCalendar();
            },
            child: Container(
              margin: const EdgeInsets.only(
                right: 15,
              ),
              child: SvgPicture.asset(
                "assets/icons/calendar.svg",
              ),
            ),
          ),
        ),
        Obx(
          () => controller.isCalendarShown.value
              ? const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: GMoneyCustomCalendar(),
                )
              : const SizedBox(),
        )
      ],
    );
  }
}
