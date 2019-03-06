import 'package:flutter/material.dart';
import 'package:flutter_product/utils/icon_font.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final Function onPress;
  final IconData icon;
  final Color leadingColor;
  final Color backgroundColor;
  final List<Widget> actions;
  CustomAppBar(
      {this.title = "No title",
      this.icon = Icons.menu,
      this.leadingColor = Colors.black,
      this.backgroundColor = Colors.white,
      this.onPress,
      this.actions});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      actions: actions,
      leading: IconButton(
          icon: Icon(icon),
          color: leadingColor,
          onPressed: () {
            if (onPress == null) {
              return null;
            } else {
              return onPress();
            }
          }),
      title: Text(
        this.title,
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: backgroundColor,
    );
  }
}
