// import 'package:find_tutors/utils/constants.dart';
// import 'package:find_tutors/utils/icon_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_product/utils/constants.dart';
import 'package:flutter_product/utils/icon_font.dart';

class CustomTextInput extends StatelessWidget {
  final String hint;
  final Color color;
  final Color iconColor;
  final IconData iconName;
  final double fontSize;
  final double iconSize;
  final Function onChanged;
  final Function onSubmitted;
  final bool autofocus;
  final bool enabled;
  final bool obscureText;
  final int maxLength;
  final TextInputType keyboardType;
  CustomTextInput({
    this.hint = "",
    this.color = const Color(0xFF196ed2),
    this.fontSize = 16.0,
    this.iconName = FeatherIcons.star,
    this.iconSize = 22.0,
    this.iconColor = const Color(0xFF196ed2),
    this.onChanged,
    this.autofocus = false,
    this.onSubmitted,
    this.enabled = true,
    this.maxLength,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
        // border: Border(

        //   bottom: BorderSide(
        //       color: Colors.grey, width: 0.7, style: BorderStyle.solid),
        // ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
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
                // filled: true,
                // labelText: "Email",
                labelStyle: TextStyle(color: Colors.red),
                // enabledBorder: new UnderlineInputBorder(
                //   borderSide: new BorderSide(color: Colors.red),
                // ),
                prefixIcon: Icon(
                  FeatherIcons.mail,
                  size: iconSize,
                ),
                border: InputBorder.none,
                hintText: hint,
                hasFloatingPlaceholder: true,
                // labelStyle: TextStyle(color: color),
                // icon: iconName != null
                //     ? Icon(
                //         iconName,
                //         size: iconSize,
                //         // color: iconColor,
                //       )
                //     : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
