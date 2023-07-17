import 'package:flutter/material.dart';
import 'package:gmoney_app/core/ui/theme/gmoney_colors.dart';
import 'package:gmoney_app/core/utils/app_size.dart';

class PrivacyAgreementInfoWidget extends StatelessWidget {
  const PrivacyAgreementInfoWidget({super.key});

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
