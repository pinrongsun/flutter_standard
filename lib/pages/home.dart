import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';


import '../widgets/ui_elements/logout_list_tile.dart';
import '../scoped-models/main.dart';

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

  Widget _buildSideDrawer(BuildContext context) {
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
          Divider(),
          LogoutListTile()
        ],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildSideDrawer(context),
      appBar: AppBar(
        title: Text('EasyList'),
        actions: <Widget>[
          ScopedModelDescendant<MainScopedModel>(
            builder: (BuildContext context, Widget child, MainScopedModel model) {
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
      body:Container(child: Text('Welcome to app development'),),
    );
  }
}
