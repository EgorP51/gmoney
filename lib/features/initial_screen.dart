import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gmoney_app/core/navigation/app_router.dart';
import 'package:gmoney_app/core/ui/theme/gmoney_colors.dart';
import 'package:gmoney_app/core/ui/widgets/gmoney_logo.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 1), () {
        AppRouter.navigateToAuthorization();
      });
    });

    return GestureDetector(
      onTap: () {
        AppRouter.navigateToAuthorization();
      },
      child: Container(
        height: double.infinity,
        width: double.infinity,
        color: context.gmoneyColors.backgroundColor,
        child: Stack(
          alignment: Alignment.center,
          children: [
            //TODO: ask about this property!
            SvgPicture.asset(
              "assets/img/background/initial_background.svg",
              fit: BoxFit.cover,
            ),
            //TODO: уточнить нужно ли менять!
            Image.asset(
              'assets/img/decoration/initial_background_center.png',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            GMoneyLogo(height: MediaQuery.of(context).size.height * 62 / 844)
          ],
        ),
      ),
    );
  }
}
