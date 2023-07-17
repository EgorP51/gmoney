import 'package:flutter/material.dart';

extension GMoneyColorsExtension on BuildContext {
  GMoneyColors get gmoneyColors => GMoneyColors();
}

class GMoneyColors {
  Color get backgroundColor => const Color(0xFF1E2028);

  Color get whiteColor => const Color(0xFFFFFFFF);

  Color get textFieldColor => const Color(0xFF333548);

  Color get buttonColor => const Color(0xFF6C5495);

  Color get labelTextColor => const Color(0xFF6B7580);

  Color get magentaTextColor => const Color(0xFF9B7ECD);

  Color get errorColor => const Color(0xFFFF3838);
}
