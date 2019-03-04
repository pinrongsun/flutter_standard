import 'package:flutter/material.dart';
import 'package:flutter_product/utils/icon_font.dart';

import 'package:scoped_model/scoped_model.dart';

import '../../scoped-models/main.dart';

class LogoutListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, MainScopedModel model) {
        return ListTile(
          leading: Icon(FeatherIcons.log_out),
          title: Text('Logout'),
          onTap: () {
            model.logout();
          },
        );
      },
    );
  }
}
