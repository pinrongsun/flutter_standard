import 'package:flutter/material.dart';
import 'package:flutter_product/widgets/appbar.dart';

class CommentPage extends StatefulWidget {
  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          CustomAppBar(
            title: 'Comment',
            onPress: () => Scaffold.of(context).openDrawer(),
          ),
          Text("Comment Page"),
        ],
      ),
    );
  }
}
