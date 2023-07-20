import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gmoney_app/core/ui/widgets/gmoney_text_field.dart';
import 'package:gmoney_app/core/utils/app_size.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({
    super.key,
    required this.label,
    required this.items,
    required this.controller,
    required this.isEmptyFieldValidation,
    this.validator,
  });

  final String? label;
  final List<String> items;
  final TextEditingController controller;
  final bool isEmptyFieldValidation;
  final String? Function(String?)? validator;

  @override
  CustomDropdownState createState() => CustomDropdownState();
}

class CustomDropdownState extends State<CustomDropdown> {
  bool isOpen = false;
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GMoneyTextField(
          controller: widget.controller,
          label: widget.label,
          isEmptyFieldValidation: widget.isEmptyFieldValidation,
          validator: widget.validator,
          suffixIcon: InkWell(
            onTap: () {
              setState(() {
                isOpen = !isOpen;
                selectedIndex = null;
                FocusScope.of(context).unfocus();
              });
            },
            child: isOpen
                ? const Icon(Icons.keyboard_arrow_up_sharp, size: 30)
                : const Icon(Icons.keyboard_arrow_down_sharp, size: 30),
          ),
        ),
        if (isOpen)
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            height: widget.items.length * 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.items.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                      widget.controller.text = widget.items[index];
                    });
                  },
                  child: Container(
                    height: 50,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.items[index],
                          style: TextStyle(
                            fontFamily: 'Circe',
                            fontSize: AppSize.itemHeight(context, 18),
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF6B7580)
                          ),
                        ),
                        if (selectedIndex == index)
                          SvgPicture.asset("assets/icons/check.svg")
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        else
          const SizedBox(),
      ],
    );
  }
}
