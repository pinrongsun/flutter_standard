import 'package:flutter/material.dart';
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
      child: new ListView(
        padding: new EdgeInsets.all(0.0),
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountEmail: new Text("bramvbilsen@gmail.com"),
            accountName: new Text("Bramvbilsen"),
            currentAccountPicture: new GestureDetector(
              child: new CircleAvatar(
                backgroundImage: AssetImage(currentProfilePic),
              ),
              onTap: () => print("This is your current account."),
            ),
            otherAccountsPictures: <Widget>[
              new GestureDetector(
                  child: new CircleAvatar(
                    backgroundImage: AssetImage(otherProfilePic),
                  ),
                  onTap: () => switchAccounts(),
                  ),
            ],
            decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: AssetImage(Constants.images.food), fit: BoxFit.fill),
            ),
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('News'),
            onTap: () {
              // Navigator.pushReplacementNamed(context, '/page1');
              Navigator.pushNamed(context, Constants.routes.news);
            },
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Test'),
            onTap: () {
              /*getTest().then((data) {
                print(data['data']);
              });*/
            },
          ),
          Divider(),
          LogoutListTile(),
          new Divider(),
          new ListTile(
            title: new Text("Cancel"),
            trailing: new Icon(Icons.cancel),
            onTap: () => Navigator.pop(context),
          ),
          // LogoutListTile()
        ],
      ),
    );
  }
}
