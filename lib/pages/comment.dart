import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_product/scoped-models/main.dart';
import 'package:flutter_product/utils/constants.dart';
import 'package:flutter_product/utils/icon_font.dart';
import 'package:flutter_product/utils/localization/app_localizations.dart';
import 'package:flutter_product/widgets/activity_indicator.dart';
import 'package:flutter_product/widgets/app_builder.dart';
import 'package:flutter_product/widgets/appbar.dart';
import 'package:flutter_product/widgets/alert_dialog.dart';
import 'package:flutter_product/widgets/card.dart';
import 'package:flutter_product/widgets/datetime_picker.dart';
import 'package:flutter_product/widgets/gradient_button.dart';
import 'package:flutter_product/widgets/modal_sheet.dart';
import 'package:flutter_product/widgets/picker.dart';
import 'package:flutter_product/widgets/snack_bar.dart';
import 'package:flutter_product/widgets/text_input.dart';
import 'package:flutter_product/widgets/touchable.dart';
import 'package:intl/intl.dart';
import 'package:scoped_model/scoped_model.dart';

class CommentPage extends StatefulWidget {
  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  String color;
  bool showIndicator = false;

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
          actions: <Widget>[
            IconButton(
              color: Colors.black,
              icon: Icon(FeatherIcons.search),
              onPressed: () => null,
            )
          ],
        ),
        Expanded(
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    'Heading1',
                    style: TextStyle(fontSize: Constants.fontSizes.display1),
                  ),
                  Text(
                    'Heading2',
                    style: TextStyle(fontSize: Constants.fontSizes.display2),
                  ),
                  Text(
                    'Title',
                    style: TextStyle(fontSize: Constants.fontSizes.title),
                  ),
                  Text(
                    'SubTitle',
                    style: TextStyle(fontSize: Constants.fontSizes.subtitle),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Text without size'),
                      Text(
                        'Text',
                        style: TextStyle(fontSize: Constants.fontSizes.body1),
                      ),
                    ],
                  ),
                  Text(
                    'Caption',
                    style: TextStyle(fontSize: Constants.fontSizes.caption),
                  ),
                  Text(
                    Translate.of(context).hello,
                    style: TextStyle(fontFamily: Constants.fonts.regular),
                  ),
                  Text(
                    Translate.of(context).hello,
                    style: TextStyle(
                        fontFamily: Constants.fonts.regular,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    Translate.of(context).hello,
                    style: TextStyle(fontFamily: Constants.fonts.bold),
                  ),
                  Text(
                    Translate.of(context).hello,
                    style: TextStyle(fontFamily: Constants.fonts.regularEn),
                  ),
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
                      CustomAlertDialog(
                          context: context,
                          child: Container(
                            color: Colors.redAccent,
                            height: 100,
                            child: Text('hello'),
                          ),
                          actions: [
                            FlatButton(
                              textColor: Constants.colors.primary,
                              child: Text(Translate.of(context).hello),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                            FlatButton(
                              textColor: Constants.colors.primary,
                              child: Text(Translate.of(context).hello),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                            FlatButton(
                              textColor: Constants.colors.primary,
                              child: Text(Translate.of(context).hello),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                            FlatButton(
                              textColor: Constants.colors.primary,
                              child: Text(Translate.of(context).hello),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                          ]).show();
                    },
                  ),
                  Text(Translate.of(context).hello),
                  ScopedModelDescendant<MainScopedModel>(
                    builder: (context, child, model) => RaisedButton(
                          onPressed: () {
                            model.onChangeLanguage();
                            AppBuilder.of(context).rebuild();
                          },
                          child: Text('Change language'),
                        ),
                  ),
//
                  CustomCard(
                    onPress: () => print('card press'),
                    left: Container(
                      width: 70,
                      child: Image(
                        image: AssetImage(Constants.images.food),
                        fit: BoxFit.fill,
                      ),
                    ),
                    content: Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                            'Card information this is a test of custom card hellohow  arey you dfsd ssdf fdsf sfs sfss sfs informa tion infor mation using expanded wid'),
                      ),
                    ),
                    right: Container(
                      width: 30,
                      child: Icon(FeatherIcons.alert_circle),
                    ),
                  ),
                  //
                  //
                  //
                  CustomCard(
                    edgeInsets:
                        EdgeInsets.only(top: 10, bottom: 10, left: 0, right: 0),
                    content: Expanded(
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
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
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    width: 35,
                                    height: 35,
                                    child: TouchableWithFeedback(
                                      borderRadius: 20,
                                      onTap: () => null,
                                      child: Icon(FeatherIcons.more_horizontal),
                                    ),
                                  ),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  child: Row(
                                    children: <Widget>[
                                      Text('52 comments'),
                                      Text('-'),
                                      Text('18 shared'),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.only(left: 25, right: 25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Touchable(
                                    icon: Icon(
                                      FeatherIcons.thumbs_up,
                                      size: 20,
                                    ),
                                    child: Text(
                                      'Like',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Touchable(
                                    icon: Icon(
                                      FeatherIcons.message_square,
                                      size: 20,
                                    ),
                                    child: Text(
                                      'Comment',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Touchable(
                                    icon: Icon(
                                      FeatherIcons.share,
                                      size: 20,
                                    ),
                                    child: Text(
                                      'Share',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //
                  //
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0, right: 40),
                    child: CustomTextInput(
                      borderRadius: 5,
                      prefixIcon: FeatherIcons.mail,
                      hint: "Email",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0, right: 40),
                    child: CustomPicker(
                      onChanged: (String val) =>
                          this.setState(() => color = val),
                      selectedValue: color,
                      items: [
                        {"label": "green", "value": "green"},
                        {"label": "yellow", "value": "yellow"}
                      ],
                      borderRadius: 5,
                      iconName: FeatherIcons.anchor,
                      hint: "Color",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: CustomDateTimePicker(
                      hint: "Date Time",
                      // inputType: "time",
                      iconName: FeatherIcons.calendar,
                      onChanged: (dt) => print(dt),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => this
                        .setState(() => this.showIndicator = !showIndicator),
                    child: Text('Loader indicator'),
                  ),
                  RaisedButton(
                    onPressed: () {
                      ScopedModel.of<MainScopedModel>(context,
                              rebuildOnChange: true)
                          .loading(true);
                    },
                    child: Text('Loader overlay'),
                  ),

                  showIndicator
                      ? ActivityIndicator(
                          color: Constants.colors.primary,
                        )
                      : Container(),

                  //network cache image
                  
                  SizedBox(
                    height: 100,
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
