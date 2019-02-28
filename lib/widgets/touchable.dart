import 'package:flutter/material.dart';
import 'package:flutter_product/utils/icon_font.dart';

class TouchableWithoutFeedback extends StatelessWidget {
  final Widget child;
  TouchableWithoutFeedback({@required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: child,
      onTap: () => null,
    );
  }
}

class TouchableWithFeedback extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final Function onTap;
  TouchableWithFeedback(
      {@required this.child, this.borderRadius: 10, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(borderRadius),
      child: child,
      onTap: () => null,
    );
  }
}

class Touchable extends StatelessWidget {
  final Function onTap;
  final double borderRadius;
  final Widget icon;
  final Widget child;

  Touchable(
      {this.onTap, this.borderRadius: 10.0, this.icon, @required this.child});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(borderRadius),
      onTap: () => onTap,
      child: Padding(
        padding: const EdgeInsets.all(7),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            icon != null
                ? Padding(padding: const EdgeInsets.only(right: 5), child: icon)
                : Container(),
            child,
          ],
        ),
      ),
    );
  }
}
