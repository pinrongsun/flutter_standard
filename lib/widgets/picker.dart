import 'package:flutter/material.dart';
import 'package:flutter_product/utils/constants.dart';
import 'package:flutter_product/utils/icon_font.dart';

class CustomPicker extends StatelessWidget {
  final String hint;
  final Color color;
  final Color iconColor;
  final IconData iconName;
  final double fontSize;
  final double iconSize;
  final Function onChanged;
  final bool enabled;
  final double borderRadius;
  final bool filled;
  final String selectedValue;
  final List<Map<String, dynamic>> items;
  CustomPicker(
      {this.hint = "",
      this.color = const Color(0xFF196ed2),
      this.iconColor = const Color(0xFF196ed2),
      this.fontSize = 16.0,
      this.iconName = FeatherIcons.star,
      this.iconSize = 22.0,
      this.enabled = true,
      this.borderRadius = 5,
      this.filled = true,
      @required this.onChanged,
      @required this.selectedValue,
      @required this.items});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: filled ? Colors.grey[200] : Colors.transparent,
      ),
      child: InputDecorator(
        decoration: InputDecoration(
          prefixIcon: Icon(
            iconName,
            size: iconSize,
          ),
          border: InputBorder.none,
          hintText: hint,
        ),
        child: DropdownButtonHideUnderline(
          child: new DropdownButton<String>(
            value: selectedValue,
            isDense: true,
            onChanged: (String value) => onChanged(value),
            items: items.map((val) {
              return DropdownMenuItem<String>(
                value: val["value"],
                child: new Text(val["label"]),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
