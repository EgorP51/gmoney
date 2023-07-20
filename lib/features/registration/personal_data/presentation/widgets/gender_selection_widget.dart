import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gmoney_app/core/ui/theme/gmoney_colors.dart';
import 'package:gmoney_app/core/ui/theme/gmoney_text_styles.dart';
import 'package:gmoney_app/features/registration/personal_data/domain/controllers/personal_data_controller.dart';

class GenderSelectionWidget extends GetView<PersonalDataController> {
  const GenderSelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child:
            Text('Пол', style: context.gmoneyTextStyle.small),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Obx(
                () => GestureDetector(
                  onTap: () {
                    controller.isMale.value = !controller.isMale.value;
                    controller.isFemale.value = !controller.isMale.value;
                  },
                  child: Container(
                      width: 23,
                      height: 23,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: context.gmoneyColors.textFieldColor,
                      ),
                      child: (controller.isMale.value)
                          ? SvgPicture.asset("assets/icons/check.svg")
                          : null),
                ),
              ),
              const SizedBox(width: 5),
              Text('Мужской', style: context.gmoneyTextStyle.small),
              const SizedBox(width: 12),
              Obx(
                () => GestureDetector(
                  onTap: () {
                    controller.isFemale.value = !controller.isFemale.value;
                    controller.isMale.value = !controller.isFemale.value;
                  },
                  child: Container(
                      width: 23,
                      height: 23,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: context.gmoneyColors.textFieldColor,
                      ),
                      child: (controller.isFemale.value)
                          ? SvgPicture.asset("assets/icons/check.svg")
                          : null),
                ),
              ),
              const SizedBox(width: 5),
              Text('Женский', style: context.gmoneyTextStyle.small),
            ],
          ),
        ],
      ),
    );
  }
}
