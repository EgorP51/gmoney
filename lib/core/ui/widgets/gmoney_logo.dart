import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GMoneyLogo extends StatelessWidget {
  const GMoneyLogo({
    this.h,
    this.w,
    super.key,
  });

  final double? h;
  final double? w;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: w,
      height: h,
      child: SvgPicture.asset('assets/gmoney_logo.svg'),
    );
  }
}
