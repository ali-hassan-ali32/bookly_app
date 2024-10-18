import 'package:flutter/material.dart';

import '../styles.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom({
    super.key,
    required this.text,
    required this.textColor,
    required this.backgroundColor,
    this.onPressed,
    this.borderRadius,
    this.fontSize,
  });
  final double? fontSize;
  final Color textColor;
  final BorderRadius? borderRadius;
  final Color backgroundColor;
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(12))),
        child: Text(
          text,
          style: Style.textStyle18.copyWith(
            fontSize: fontSize,
            color: textColor,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
