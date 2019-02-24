import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import '../widgets/ui_elements/logout_list_tile.dart';
import '../scoped-models/main.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class HomePage extends StatefulWidget {
  final MainScopedModel model;

  HomePage(this.model);

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  initState() {
    super.initState();
  }
  String currentProfilePic = "https://avatars3.githubusercontent.com/u/16825392?s=460&v=4";
  String otherProfilePic = "https://yt3.ggpht.com/-2_2skU9e2Cw/AAAAAAAAAAI/AAAAAAAAAAA/6NpH9G8NWf4/s900-c-k-no-mo-rj-c0xffffff/photo.jpg";

  void switchAccounts() {
    String picBackup = currentProfilePic;
    this.setState(() {
      currentProfilePic = otherProfilePic;
      otherProfilePic = picBackup;
    });
  }

  Widget _buildSideDrawer(BuildContext context) {


    return Drawer(
      child: new ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountEmail: new Text("bramvbilsen@gmail.com"),
            accountName: new Text("Bramvbilsen"),
            currentAccountPicture: new GestureDetector(
              child: new CircleAvatar(
                backgroundImage: new NetworkImage(currentProfilePic),
              ),
              onTap: () => print("This is your current account."),
            ),
            otherAccountsPictures: <Widget>[
              new GestureDetector(
                child: new CircleAvatar(
                  backgroundImage: new NetworkImage(otherProfilePic),
                ),
                onTap: () => switchAccounts(),
              ),
            ],
            decoration: new BoxDecoration(
                image: new DecorationImage(
                    image: new NetworkImage("https://img00.deviantart.net/35f0/i/2015/018/2/6/low_poly_landscape__the_river_cut_by_bv_designs-d8eib00.jpg"),
                    fit: BoxFit.fill
                )
            ),
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('News'),
            onTap: () {
              // Navigator.pushReplacementNamed(context, '/page1');
              Navigator.pushNamed(context, '/news');
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
          LogoutListTile(),
          new Divider(),
          new ListTile(
            title: new Text("Cancel"),
            trailing: new Icon(Icons.cancel),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text('Choose'),
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('News'),
            onTap: () {
              // Navigator.pushReplacementNamed(context, '/page1');
              Navigator.pushNamed(context, '/news');
            },
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Test'),
            onTap: () {
               getTest().then((data) {
                print(data['data']);
              });
            },
          ),
          Divider(),
          LogoutListTile()
        ],
      ),
    );
  }

  Future getTest() async {
    var url = 'http://192.168.0.106:3000/test';
    return await http.post(url, body: {
      "test1": "PR",
      "test2": "LK",
    }).then((http.Response response) {
      return jsonDecode(response.body);
    }).catchError((err) => err);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildSideDrawer(context),
      appBar: AppBar(
        title: Text('EasyList'),
        actions: <Widget>[
          ScopedModelDescendant<MainScopedModel>(
            builder:
                (BuildContext context, Widget child, MainScopedModel model) {
              return IconButton(
                icon: Icon(Icons.notifications_active),
                onPressed: () {
                  print('Hello');
                },
              );
            },
          )
        ],
      ),
      body: Container(
        child: Text('Welcome to app development'),
      ),
    );
  }
}
