import 'package:flutter/material.dart';
import 'package:spoti/core/configs/theme/app_colors.dart';

class SquareRoundTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final double borderRadius;
  final Color enabledBorderColor;
  final Color focusedBorderColor;

  const SquareRoundTextField({
    Key? key,
    required this.controller,
    this.hintText = '',
    this.keyboardType = TextInputType.text,
    this.borderRadius = 10.0,
    this.enabledBorderColor = Colors.grey,
    this.focusedBorderColor = AppColors.primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: enabledBorderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: focusedBorderColor),
        ),
      ),
    );
  }
}
