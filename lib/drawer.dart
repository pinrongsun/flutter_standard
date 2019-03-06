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
                  maxRadius: 40,
                  backgroundImage: AssetImage(currentProfilePic),
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(
                  top: 210,
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
            ],
          ),
          SizedBox(
            height: 10,
          ),
          drawerItem(
              selected: true,
              icon: FeatherIcons.file_text,
              text: "News",
              // Navigator.pushReplacementNamed(context, '/page1');
              onTap: () => Navigator.pushNamed(context, Constants.routes.news)),
          drawerItem(
              selected: false, icon: FeatherIcons.file_text, text: "Test"),
          Divider(),
          LogoutListTile(),
          // LogoutListTile()
        ],
      ),
    );
  }

  Widget drawerItem(
      {bool selected,
      Function onTap,
      @required IconData icon,
      @required String text}) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Card(
        elevation: 0,
        color: selected ? Colors.blue[100] : Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Container(
                  child: Icon(
                    icon,
                    color: selected ? Constants.colors.primary : Colors.black,
                    size: Constants.fontSizes.heading2,
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  text,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: selected ? Constants.colors.primary : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
