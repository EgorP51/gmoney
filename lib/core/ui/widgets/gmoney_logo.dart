import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GMoneyLogo extends StatelessWidget {
  const GMoneyLogo({
    this.height,
    this.width,
    super.key,
  });

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: SvgPicture.asset('assets/gmoney_logo.svg'),
    );
  }
}
