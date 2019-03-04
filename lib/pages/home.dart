import 'package:flutter/material.dart';
import 'package:flutter_product/utils/constants.dart';
import 'package:flutter_product/utils/icon_font.dart';
import 'package:flutter_product/widgets/card.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

Widget _buildMenuButton({String text, IconData icon}) {
  return Stack(
    children: <Widget>[
      SizedBox.expand(
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(10.0),
          shadowColor: Colors.black38,
          color: Colors.white,
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () => null,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Icon(
                    icon,
                    size: 40,
                  ),
                ),
                Text(text)
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

class _HomePageState extends State<HomePage> {
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          automaticallyImplyLeading: true,
          pinned: true,
          expandedHeight: 190,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('Home'),
            centerTitle: true,
          ),
          leading: IconButton(
            icon: Icon(
              FeatherIcons.menu,
              // color: Constants.colors.primary,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        SliverGrid.count(
          crossAxisCount: 3,
          childAspectRatio: 1.0 / 1.0,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5),
              color: Constants.colors.success,
              height: 60,
              width: 60,
              child: _buildMenuButton(
                text: 'Success',
                icon: FeatherIcons.check_square,
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              color: Constants.colors.primary,
              height: 60,
              width: 60,
              child: _buildMenuButton(
                text: 'Primary',
                icon: FeatherIcons.square,
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              color: Constants.colors.danger,
              height: 60,
              width: 60,
              child: _buildMenuButton(
                text: 'Danger',
                icon: FeatherIcons.x_square,
              ),
            ),
            
          ],
        ),
        SliverGrid.count(
          crossAxisCount: 1,
          childAspectRatio: 3,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5),
              color: Constants.colors.warning,
              height: 60,
              width: 60,
              child: Stack(
                children: <Widget>[
                  SizedBox.expand(
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(10.0),
                      shadowColor: Colors.black38,
                      color: Colors.white,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () => null,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Title",
                                style: TextStyle(
                                    fontSize: Constants.fontSizes.title),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Subtitle",
                                style: TextStyle(
                                    fontSize: Constants.fontSizes.subtitle),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    child: Icon(
                      FeatherIcons.shopping_bag,
                      size: 70,
                    ),
                    right: 5,
                    bottom: 5,
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

//
// final MainScopedModel model;
// HomePage(this.model);

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

// Future getTest() async {
//   var url = 'http://192.168.0.106:3000/test';
//   return await http.post(url, body: {
//     "test1": "PR",
//     "test2": "LK",
//   }).then((http.Response response) {
//     return jsonDecode(response.body);
//   }).catchError((err) => err);
// }

// @override
// Widget build(BuildContext context) {
//   //root scaffold
//   return Scaffold(
//     drawer: CustomDrawer(),
//     appBar: AppBar(
//       title: Text('EasyList'),
//       actions: <Widget>[
//         ScopedModelDescendant<MainScopedModel>(
//           builder:
//               (BuildContext context, Widget child, MainScopedModel model) {
//             return IconButton(
//               icon: Icon(Icons.notifications_active),
//               onPressed: () {
//                 print('Hello');
//               },
//             );
//           },
//         )
//       ],
//     ),
//     body: Container(
//       child: Text('Welcome to app development'),
//     ),
//   );
// }
