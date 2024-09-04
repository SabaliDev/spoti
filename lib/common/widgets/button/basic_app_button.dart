import 'package:flutter/material.dart';

class BasicAppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double? height;
  final Color? textColor;
  final double borderRadius;

  const BasicAppButton({
    Key? key,
    required this.onPressed,
    required this.title,
    this.height,
    this.textColor,
    this.borderRadius = 10.0, // Default border radius
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height ?? 80),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
