import 'package:flutter/material.dart';
import 'package:flutter_product/utils/constants.dart';
import 'package:flutter_product/utils/icon_font.dart';
import 'package:flutter_product/utils/localization/app_localizations.dart';
import 'package:flutter_product/widgets/appbar.dart';
import 'package:flutter_product/widgets/alert_dialog.dart';
import 'package:flutter_product/widgets/gradient_button.dart';
import 'package:flutter_product/widgets/modal_sheet.dart';
import 'package:flutter_product/widgets/snack_bar.dart';

class CommentPage extends StatefulWidget {
  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  _showModalSheets(context) {
    CustomBottomSheet(
      context: context,
      // height: ,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          new ListTile(
            onTap: () {
              Navigator.pop(context);
              CustomSnackBar(
                      context: context,
                      type: "warning",
                      content: "warning message")
                  .show();
            },
            leading: new Icon(
              FeatherIcons.edit3,
            ),
            title: new Text(
              "Edit Profile",
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          new Divider(
            height: 4.0,
          ),
          new ListTile(
            leading: new Icon(
              FeatherIcons.users,
            ),
            title: new Text(
              "Following",
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          new Divider(
            height: 4.0,
          ),
          new ListTile(
            leading: new Icon(
              FeatherIcons.heart,
            ),
            title: new Text(
              "Likes",
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          new Divider(
            height: 4.0,
          ),
          new Padding(
            padding: EdgeInsets.only(top: 6.0, bottom: 6.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "Privacy Policy",
                  style: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                new Container(
                  width: 25.0,
                  child: new Icon(
                    Icons.arrow_drop_down_circle,
                    size: 5.0,
                  ),
                ),
                //new Icon(
                //Icons.,
                //),
                new Text(
                  "Terms of service",
                  style: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          CustomAppBar(
            title: 'Comment',
            onPress: () => Scaffold.of(context).openDrawer(),
          ),
          Text("Comment Page"),
          GradientButton(
            onPressed: () {
              CustomSnackBar(
                context: context,
                type: "success",
                content: "ជោគជ័យ",
              ).show();
            },
            text: "Snack Bar",
          ),
          GradientButton(
            onPressed: () => _showModalSheets(context),
            text: "Modal Sheet",
          ),
          RaisedButton(
            child: Text("alert dialog yes no"),
            onPressed: () {
              CustomAlertDialog(context: context).showYesNo();
            },
          ),
          RaisedButton(
            child: Text("alert dialog"),
            onPressed: () {
              CustomAlertDialog(context: context, actions: [
                FlatButton(
                  textColor: Constants.colors.primary,
                  child: Text("Okay"),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ]).show();
            },
          ),
          Text(Translate.of(context).hello),
          RaisedButton(
            onPressed: () => null,
            child: Text('Change language'),
          )
        ],
      ),
    );
  }
}
