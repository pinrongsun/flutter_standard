import 'package:flutter/material.dart';
import 'package:flutter_product/utils/constants.dart';
import 'package:flutter_product/utils/icon_font.dart';
import 'package:flutter_product/utils/localization/app_localizations.dart';
import 'package:flutter_product/widgets/appbar.dart';
import 'package:flutter_product/widgets/alert_dialog.dart';
import 'package:flutter_product/widgets/card.dart';
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
                      message: "warning message")
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
    return Column(
      children: <Widget>[
        CustomAppBar(
          title: 'Comment',
          onPress: () => Scaffold.of(context).openDrawer(),
        ),
        Expanded(
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text("Comment Page"),
                  GradientButton(
                    onPressed: () {
                      CustomSnackBar(
                        context: context,
                        type: "success",
                        message: "ជោគជ័យ",
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
                  ),
                  CustomCard(
                    onPress: () => print('card press'),
                    left: Image(
                      image: AssetImage(Constants.images.food),
                      fit: BoxFit.fill,
                    ),
                    content: Text(
                        'Card information  informa tion infor mation using expanded wid'),
                    right: Icon(FeatherIcons.alert_circle),
                    height: 100,
                  ),
                  //this custom card should be placed under ui_elements or...
                  CustomCard(
                    edgeInsets: EdgeInsets.only(top: 5, bottom: 5),
                    content: Column(
                      children: <Widget>[
                        Container(
                          height: 50,
                          // color: Constants.colors.danger,
                          child: Row(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Container(
                                        width: 40.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(
                                                Constants.images.avatar),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text('Phirum'),
                                        Text('Developer')
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Container(),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Icon(FeatherIcons.more_horizontal),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text('statusMesage'),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image(
                            image: AssetImage(Constants.images.food),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text('picture description'),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    FeatherIcons.package,
                                    size: 16,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text('496'),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Row(
                                children: <Widget>[
                                  Text('52 comments'),
                                  Text('-'),
                                  Text('18 shared'),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Container(
                                height: 40,
                                // color: Constants.colors.info,
                                child: Row(
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: <Widget>[
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(right: 5),
                                            child: Icon(
                                              FeatherIcons.thumbs_up,
                                              size: 20,
                                            ),
                                          ),
                                          Text('Like'),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 5),
                                              child: Icon(
                                                FeatherIcons.message_square,
                                                size: 20,
                                              ),
                                            ),
                                            Text('Comment'),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(right: 5),
                                            child: Icon(
                                              FeatherIcons.share,
                                              size: 20,
                                            ),
                                          ),
                                          Text('Share'),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    height: 440,
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
