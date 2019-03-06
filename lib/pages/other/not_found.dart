import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  final String title;
  NotFoundPage({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(title),
      ),
    );
  }
}
