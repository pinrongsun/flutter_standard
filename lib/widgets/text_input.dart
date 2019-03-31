import 'package:flutter/material.dart';
import 'package:flutter_product/utils/constants.dart';
import 'package:flutter_product/utils/icon_font.dart';

class CustomTextInput extends StatelessWidget {
  final String hint;
  final Color color;
  final Color iconColor;
  final IconData prefixIcon;
  final IconData suffixIcon;
  final double fontSize;
  final double iconSize;
  final Function onChanged;
  final Function onSubmitted;
  final bool autofocus;
  final bool enabled;
  final bool obscureText;
  final int maxLength;
  final TextInputType keyboardType;
  final double borderRadius;
  final bool filled;
  final Color backgroundColor;
  CustomTextInput({
    this.hint = "",
    this.color = const Color(0xFF196ed2),
    this.fontSize = 16.0,
    this.prefixIcon,
    this.suffixIcon,
    this.iconSize = 22.0,
    this.iconColor = const Color(0xFF196ed2),
    this.onChanged,
    this.autofocus = false,
    this.onSubmitted,
    this.enabled = true,
    this.maxLength,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.borderRadius = 5,
    this.filled = true,
    this.backgroundColor,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: prefixIcon != null ? 0 : 10,
          right: suffixIcon != null ? 0 : 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: filled
            ? Colors.grey[200]
            : backgroundColor != null ? backgroundColor : Colors.white,
      ),
      child: TextField(
        keyboardType: keyboardType,
        obscureText: obscureText,
        onChanged: onChanged,
        autofocus: autofocus,
        enabled: enabled,
        maxLength: maxLength,
        onSubmitted: onSubmitted,
        textAlign: TextAlign.left,
        style: TextStyle(color: color, fontSize: fontSize),
        decoration: InputDecoration(
          // filled: filled,
          // labelText: "Email",
          // labelStyle: TextStyle(color: Colors.red),
          prefixIcon: prefixIcon != null
              ? Icon(
                  prefixIcon,
                  size: iconSize,
                )
              : null,
          suffixIcon: suffixIcon != null
              ? Icon(
                  suffixIcon,
                  size: iconSize,
                )
              : null,
          border: InputBorder.none,
          hintText: hint,
          hasFloatingPlaceholder: true,
        ),
      ),
    );
  }
}
