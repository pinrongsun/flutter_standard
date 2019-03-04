import 'package:flutter/material.dart';
import 'package:flutter_product/utils/icon_font.dart';
import './utils/constants.dart';
import './widgets/ui_elements/logout_list_tile.dart';

class CustomDrawer extends StatefulWidget {
  CustomDrawer({this.onTabMenuTap});
  final Function onTabMenuTap;
  @override
  CustomDrawerState createState() {
    return new CustomDrawerState();
  }
}

class CustomDrawerState extends State<CustomDrawer> {
  String currentProfilePic = Constants.images.avatar;
  String otherProfilePic = Constants.images.appIcon;

  void switchAccounts() {
    String picBackup = currentProfilePic;
    this.setState(() {
      currentProfilePic = otherProfilePic;
      otherProfilePic = picBackup;
    });
  }

  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(0.0),
        children: <Widget>[
          Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox.fromSize(
                    size: Size.fromHeight(170),
                    // width: 3000,
                    // color: Colors.blue,
                    child: Image(
                      image: AssetImage(Constants.images.food),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(
                  top: 120,
                  right: 20.0,
                  left: 20.0,
                ),
                child: CircleAvatar(
                  maxRadius: 45,
                  backgroundImage: AssetImage(currentProfilePic),
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(
                  top: 220,
                  right: 20.0,
                  left: 20.0,
                ),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Narong Unfake Real Zin',
                      style: TextStyle(fontSize: Constants.fontSizes.title),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'qwerkh@gmail.com',
                        style:
                            TextStyle(fontSize: Constants.fontSizes.subtitle),
                      ),
                    )
                  ],
                ),
              ),
              // Column(
              //   children: <Widget>[
              //     Container(
              //       height: 170,
              //       child: 
              //     ),
              //   ],
              // ),
              // Positioned(
              //   child: CircleAvatar(
              //     maxRadius: 35,
              //     backgroundImage: AssetImage(currentProfilePic),
              //   ),
              // )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Icon(FeatherIcons.archive),
            title: Text('News'),
            onTap: () {
              // Navigator.pushReplacementNamed(context, '/page1');
              Navigator.pushNamed(context, Constants.routes.news);
            },
          ),
          ListTile(
            leading: Icon(FeatherIcons.file_text),
            title: Text('Test'),
            onTap: () => null,
          ),
          Divider(),
          LogoutListTile(),
          // LogoutListTile()
        ],
      ),
    );
  }
}
