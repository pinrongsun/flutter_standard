import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_product/utils/constants.dart';

class CustomAlertDialog {
  BuildContext context;
  String title;
  String text;
  Widget child;
  List<Widget> actions;
  Function yes;
  Function no;

  CustomAlertDialog(
      {@required this.context,
      this.title = "title",
      this.text = "content",
      this.child,
      this.actions,
      this.yes,
      this.no});

  show() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: EdgeInsets.all(15),
          contentPadding: EdgeInsets.only(left: 15, right: 15),
          title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          content: child,
          actions: actions,
        );
      },
    );
  }

  showYesNo() {
    if (no == null) {
      no = Navigator.of(context).pop;
    }
    if (yes == null) {
      yes = Navigator.of(context).pop;
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Text(text),
          actions: <Widget>[
            FlatButton(
              child: Text("CANCEL",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
              textColor: Constants.colors.primary,
              onPressed: () => no(),
            ),
            FlatButton(
              child: Text("OK",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
              textColor: Constants.colors.primary,
              onPressed: () => yes(),
            )
          ],
        );
      },
    );
  }

  showIos() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text("title"),
            content: Text("content"),
            // actions: <Widget>[
            //   FlatButton(child: Text("Yes"), onPressed: ()=>null,),
            //   FlatButton(child: Text("No"), onPressed: ()=>null,),
            //   // CupertinoDialogAction(
            //   //   child: Text("Yes"),
            //   //   isDefaultAction: true,
            //   //   onPressed: () => null,
            //   // ),
            //   // CupertinoDialogAction(
            //   //   child: Text("No"),
            //   //   onPressed: () => Navigator.of(context).pop(),
            //   // )
            // ],
          );
        });
  }
}
