import 'package:flutter/material.dart';
import 'package:flutter_product/drawer.dart';
import 'package:scoped_model/scoped_model.dart';
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
  // Widget _buildSideDrawer(BuildContext context) {
  //   return Drawer(
  //     child: Column(
  //       children: <Widget>[
  //         AppBar(
  //           automaticallyImplyLeading: false,
  //           title: Text('Choose'),
  //         ),
  //         ListTile(
  //           leading: Icon(Icons.edit),
  //           title: Text('News'),
  //           onTap: () {
  //             // Navigator.pushReplacementNamed(context, '/page1');
  //             Navigator.pushNamed(context, '/news');
  //           },
  //         ),
  //         ListTile(
  //           leading: Icon(Icons.edit),
  //           title: Text('Test'),
  //           onTap: () {
  //              getTest().then((data) {
  //               print(data['data']);
  //             });
  //           },
  //         ),
  //         Divider(),
  //         LogoutListTile()
  //       ],
  //     ),
  //   );
  // }

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
    //root scaffold
    return Scaffold(
      drawer: CustomDrawer(),
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
