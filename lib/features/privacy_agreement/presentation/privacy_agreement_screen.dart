import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gmoney_app/core/ui/theme/gmoney_colors.dart';
import 'package:gmoney_app/core/ui/widgets/default_background.dart';
import 'package:gmoney_app/core/ui/widgets/gmoney_back_button.dart';
import 'package:gmoney_app/core/ui/widgets/gmoney_button.dart';
import 'package:gmoney_app/core/utils/app_size.dart';

import 'package:get/get.dart';

class PrivacyAgreementController extends GetxController {
  var enabled = false.obs;

  void toggleCheckbox() {
    if (enabled.value) {
      enabled.value = false;
    } else {
      enabled.value = true;
    }
  }
}

class PrivacyAgreementScreen extends StatelessWidget {
  PrivacyAgreementScreen({super.key});

  final PrivacyAgreementController privacyAgreementController =
      Get.put(PrivacyAgreementController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          const DefaultBackground(),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: EdgeInsets.only(top: AppSize.itemHeight(context, 60)),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _TextContent(),
                    const InfoWidget(),
                    PolicyConfirmationWidget(),
                    SizedBox(
                      height: 10,
                    ),
                    Obx(
                      () => GMoneyButton(
                        title: Text(
                          'продолжить'.toUpperCase(),
                          style: TextStyle(
                            color: context.gmoneyColors.whiteColor,
                            fontFamily: 'Circe',
                            fontSize: AppSize.itemHeight(context, 16),
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5,
                          ),
                        ),
                        enabled: privacyAgreementController.enabled.value,
                        onPressed: () {},
                      ),
                    ),
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

class _TextContent extends StatelessWidget {
  const _TextContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      child: Text(
        'Соглашение \nконфиденциальности',
        textAlign: TextAlign.start,
        maxLines: 2,
        style: TextStyle(
          color: context.gmoneyColors.whiteColor,
          fontFamily: 'Circe',
          fontSize: AppSize.itemWidth(context, 24),
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}

class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.only(top: 15, left: 15, bottom: 15, right: 8),
        decoration: BoxDecoration(
          color: context.gmoneyColors.whiteColor,
          borderRadius: BorderRadius.circular(12),
        ),
        height: AppSize.itemHeight(context, 500),
        child: ScrollbarTheme(
          data: ScrollbarThemeData(
            thumbColor: MaterialStateProperty.all<Color>(
                context.gmoneyColors.buttonColor),
            trackColor:
                MaterialStateProperty.all<Color>(const Color(0xFFE2E2E2)),
            thickness: MaterialStateProperty.all<double>(3),
            radius: const Radius.circular(2),
          ),
          child: Scrollbar(
            child: ListView(
              children: const [
                Padding(
                  padding: EdgeInsets.only(
                    right: 7,
                  ),
                  child: Text(
                    '''Многие думают, что Lorem Ipsum - взятый с потолка псевдо-латинский набор слов, но это не совсем так. Его корни уходят в один фрагмент классической латыни 45 года н.э., то есть более двух тысячелетий назад.
                    \nРичард МакКлинток, профессор латыни из колледжа Hampden-Sydney, штат Вирджиния, взял одно из самых странных слов в Lorem Ipsum, "consectetur", и занялся его поисками в классической латинской литературе.
                    \nВ результате он нашёл неоспоримый первоисточник Lorem Ipsum в разделах 1.10.32 и 1.10.33 книги "de Finibus Bonorum et Malorum" ("О пределах добра и зла"), написанной Цицероном в 45 году н.э.
                    \nЭтот трактат по теории этики был очень популярен в эпоху Возрождения. Первая строка Lorem Ipsum, "Lorem ipsum dolor sit amet..", происходит от одной из строк в разделе 1.10.32
                    \nВ результате он нашёл неоспоримый первоисточник Lorem Ipsum в разделах 1.10.32 и 1.10.33 книги "de Finibus Bonorum et Malorum" ("О пределах добра и зла"), написанной Цицероном в 45 году н.э.''',
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PolicyConfirmationWidget extends StatelessWidget {
  PolicyConfirmationWidget({super.key});

  final PrivacyAgreementController privacyAgreementController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Obx(
          () => GestureDetector(
            onTap: () {
              privacyAgreementController.toggleCheckbox();
            },
            child: Container(
              width: AppSize.itemHeight(context, 23),
              height: AppSize.itemHeight(context, 23),
              margin: const EdgeInsets.only(left: 16, right: 8),
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: context.gmoneyColors.whiteColor,
              ),
              child: privacyAgreementController.enabled.value
                  ? SvgPicture.asset("assets/icons/check.svg")
                  : null,
            ),
          ),
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: 'C ',
                style: TextStyle(
                  color: context.gmoneyColors.whiteColor,
                  fontFamily: "Circe",
                  fontWeight: FontWeight.w300,
                  fontSize: AppSize.itemWidth(context, 14),
                ),
              ),
              TextSpan(
                text: 'Политикой конфиденциальности',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: context.gmoneyColors.magentaTextColor,
                  fontFamily: "Circe",
                  fontWeight: FontWeight.w300,
                  fontSize: AppSize.itemWidth(context, 14),
                ),
              ),
              TextSpan(
                text: ' ознакомлен',
                style: TextStyle(
                  color: context.gmoneyColors.whiteColor,
                  fontFamily: "Circe",
                  fontWeight: FontWeight.w300,
                  fontSize: AppSize.itemWidth(context, 14),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
