import 'package:flutter/material.dart';
import 'package:gmoney_app/core/ui/widgets/gmoney_back_button.dart';
import 'package:gmoney_app/core/ui/widgets/gmoney_logo.dart';
import 'package:gmoney_app/core/utils/app_size.dart';

class DefaultTopWidget extends StatelessWidget {
  const DefaultTopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Align(
          alignment: Alignment.topLeft,
          child: GMoneyBackButton(),
        ),
        Container(
          alignment: Alignment.topCenter,
          child: GMoneyLogo(
            height: AppSize.itemHeight(context, 42),
          ),
        ),
      ],
    );
  }
}
