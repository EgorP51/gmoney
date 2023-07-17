import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gmoney_app/core/ui/theme/gmoney_colors.dart';
import 'package:gmoney_app/core/ui/widgets/gmoney_logo.dart';
import 'package:gmoney_app/core/utils/app_size.dart';

class DefaultBackground extends StatelessWidget {
  const DefaultBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: context.gmoneyColors.backgroundColor,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SvgPicture.asset(
              "assets/img/background/authorization_background.svg",
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Image.asset(
              'assets/img/decoration/authorization_background_left.png',
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              'assets/img/decoration/authorization_background_right.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(top: AppSize.itemHeight(context, 20)),
            child: GMoneyLogo(
              height: AppSize.itemHeight(context, 42),
            ),
          ),
        ],
      ),
    );
  }
}
