import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gmoney_app/core/ui/widgets/custom_calendar.dart';
import 'package:gmoney_app/core/ui/widgets/gmoney_text_field.dart';
import 'package:gmoney_app/features/registration/bank_account/domain/controllers/bank_account_controller.dart';

class IssueDateWidget extends GetView<BankAccountController> {
  const IssueDateWidget(this.isEmptyFieldValidation, {super.key});

  final bool isEmptyFieldValidation;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GMoneyTextField(
          label: 'Дата выдачи',
          controller: controller.issueDateController,
          isEmptyFieldValidation: isEmptyFieldValidation,
          validator: (value) => controller.dateValidator(value),
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
              ? Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: GMoneyCustomCalendar(
                    onDateSelected: (selectedDateTime) {
                      controller
                        ..issueDate = selectedDateTime
                        ..issueDateController.text =
                            '${selectedDateTime.day.toString().padLeft(2, '0')}/'
                                '${selectedDateTime.month.toString().padLeft(2, '0')}/'
                                '${selectedDateTime.year.toString()}';
                    },
                  ),
                )
              : const SizedBox(),
        )
      ],
    );
  }
}
