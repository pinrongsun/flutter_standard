import 'package:flutter/material.dart';
import 'package:flutter_product/utils/constants.dart';

class CustomCard extends StatelessWidget {
  final Function onPress;
  final Widget left;
  final Widget right;
  final Widget content;
  final Color backgroundColor;
  final double elevation;
  final EdgeInsets edgeInsets;
  final bool border;
  CustomCard({
    this.onPress,
    this.elevation: 3,
    this.border = false,
    this.backgroundColor,
    this.left,
    this.right,
    this.edgeInsets: const EdgeInsets.all(10),
    @required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: border
          ? BoxDecoration(
              border: Border.all(color: Constants.colors.background),
              borderRadius: BorderRadius.circular(5),
            )
          : null,
      child: Material(
        color: backgroundColor != null ? backgroundColor : null,
        borderRadius: BorderRadius.circular(5),
        elevation: elevation,
        child: InkWell(
          onTap: onPress,
          borderRadius: BorderRadius.circular(5),
          child: Container(
            padding: edgeInsets,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                left != null
                    ? Align(
                        alignment: Alignment.centerLeft,
                        child: left,
                      )
                    : Container(),
                content,
                right != null
                    ? Align(
                        alignment: Alignment.centerRight,
                        child: right,
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
