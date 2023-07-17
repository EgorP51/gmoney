import 'package:flutter/cupertino.dart';
import 'package:gmoney_app/core/ui/theme/gmoney_colors.dart';
import 'package:gmoney_app/core/utils/app_size.dart';

class GMoneyButton extends StatelessWidget {
  const GMoneyButton({
    required this.title,
    this.enabled = true,
    this.onPressed,
    super.key,
  });

  final Widget title;
  final VoidCallback? onPressed;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 16,
      ),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: context.gmoneyColors.buttonColor.withOpacity(0.35),
              offset: const Offset(0, 16),
              blurRadius: 44,
              spreadRadius: 0,
            ),
          ],
        ),
        height: AppSize.itemHeight(context, 60),
        width: double.infinity,
        child: CupertinoButton(
          onPressed: enabled ? onPressed : null,
          color: context.gmoneyColors.buttonColor,
          borderRadius: BorderRadius.circular(12),
          child: Center(child: title),
        ),
      ),
    );
  }
}
