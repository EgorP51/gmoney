import 'package:flutter/material.dart';
import 'package:gmoney_app/core/ui/theme/gmoney_colors.dart';
import 'package:gmoney_app/core/utils/app_size.dart';

class GMoneyTextField extends StatelessWidget {
  const GMoneyTextField({
    this.controller,
    this.textInputType,
    this.textInputAction,
    this.label,
    this.validator,
    this.obscureText = false,
    this.onSaved,
    this.onTap,
    this.isEmptyFieldValidation = false,
    super.key,
  });

  final TextEditingController? controller;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;
  final String? label;
  final void Function(String?)? onSaved;
  final void Function()? onTap;
  final bool obscureText;
  final bool isEmptyFieldValidation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 5,
      ),
      child: SizedBox(
        //TODO: check if it normalno?
        //height: AppSize.itemHeight(context, 60),
        child: TextFormField(
          onTap: onTap,
          controller: controller,
          keyboardType: textInputType,
          enableSuggestions: false,
          textInputAction: textInputAction,
          enableIMEPersonalizedLearning: false,
          autocorrect: false,
          onSaved: onSaved,
          enableInteractiveSelection: false,
          obscureText: obscureText,
          validator: validator,
          textAlign: TextAlign.start,
          scrollPadding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          style: TextStyle(
            color: context.gmoneyColors.whiteColor,
            fontFamily: 'Circe',
            fontSize: AppSize.itemHeight(context, 20),
            fontWeight: FontWeight.w600,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: context.gmoneyColors.textFieldColor,
            contentPadding:
                EdgeInsets.symmetric(vertical: AppSize.itemHeight(context, 16)),
            prefix: const Padding(padding: EdgeInsets.only(left: 20.0)),
            isDense: true,
            label: label == null
                ? null
                : Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      label!,
                      style: TextStyle(
                        color: context.gmoneyColors.labelTextColor,
                        fontFamily: 'Circe',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                //TODO: удалить это говно
                borderSide: (!isEmptyFieldValidation)
                    ? BorderSide.none
                    : (controller!.text.isEmpty)
                        ? const BorderSide(
                            color: Colors.red,
                            width: 1,
                            style: BorderStyle.solid,
                          )
                        : BorderSide.none),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(12),
            ),
            errorStyle: TextStyle(
                color: context.gmoneyColors.errorColor,
                fontFamily: 'Circe',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                height: 0.8),
            errorMaxLines: 2,
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: context.gmoneyColors.errorColor,
                width: 1,
                style: BorderStyle.solid,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
