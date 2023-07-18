import 'package:flutter/material.dart';
import 'package:gmoney_app/core/ui/theme/gmoney_colors.dart';
import 'package:gmoney_app/core/utils/app_size.dart';

class RegistrationProgressWidget extends StatelessWidget {
  const RegistrationProgressWidget({
    required this.totalItemCount,
    required this.completedItemCount,
    super.key,
  });

  final int totalItemCount;
  final int completedItemCount;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(
          top: AppSize.itemHeight(context, 10),
          bottom: AppSize.itemHeight(context, 16)
        ),
        height: AppSize.itemHeight(context, 29),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: totalItemCount,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              width: AppSize.itemWidth(context, 45),
              height: AppSize.itemHeight(context, 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: (index + 1) <= completedItemCount
                    ? context.gmoneyColors.buttonColor
                    : context.gmoneyColors.whiteColor,
              ),
            );
          },
        ),
      ),
    );
  }
}
