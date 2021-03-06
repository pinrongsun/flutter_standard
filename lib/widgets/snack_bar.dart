import 'package:flutter/material.dart';
import 'package:flutter_product/utils/constants.dart';
import 'package:flutter_product/utils/icon_font.dart';

class CustomSnackBar {
  BuildContext context;
  String message;
  String type;
  Color backgroundColor;
  Function action;
  int duration;
  String actionLabel = "dismiss";
  CustomSnackBar(
      {@required this.context,
      this.message = "message",
      this.type = "default",
      this.backgroundColor = const Color(0xFF196ed2),
      this.action,
      this.duration = 2,
      this.actionLabel = "dismiss"});

  _icon() {
    switch (type) {
      case "success":
        return Icon(FeatherIcons.check_square, size: 21);
        break;
      case "danger":
        return Icon(FeatherIcons.x_circle, size: 21);
        break;
      case "warning":
        return Icon(FeatherIcons.alert_triangle, size: 21);
        break;
      case "info":
        return Icon(FeatherIcons.alert_circle, size: 21);
        break;
      default:
        return Icon(FeatherIcons.alert_circle, size: 21);
        break;
    }
  }

  _backgroundColor() {
    switch (type) {
      case "success":
        return Constants.colors.success;
        break;
      case "danger":
        return Constants.colors.danger;
        break;
      case "warning":
        return Constants.colors.warning;
        break;
      case "info":
        return Constants.colors.info;
        break;
      default:
        return Constants.colors.primary;
        break;
    }
  }

  show() {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Container(
          height: 53.0,
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(bottom: 5), child: _icon()),
              Text(
                message,
                style: TextStyle(
                    // fontSize: Constants.fontSizes.text,
                    fontFamily: Constants.fonts.regular),
              ),
            ],
          ),
        ),
        backgroundColor: _backgroundColor(),
        duration: Duration(seconds: duration),
      ),
    );
  }

  // showWithAction() {
  //   Scaffold.of(context).showSnackBar(
  //     SnackBar(
  //       message: Text(message),
  //       backgroundColor: _backgroundColor(),
  //       duration: Duration(seconds: duration),
  //       action: SnackBarAction(
  //         label: actionLabel,
  //         onPressed: () => action(),
  //       ),
  //     ),
  //   );
  // }
}
