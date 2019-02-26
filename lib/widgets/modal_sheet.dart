//packages
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CustomBottomSheet {
  BuildContext context;
  final double height;
  Widget child;
  CustomBottomSheet(
      {@required this.context, this.height, @required this.child});
  show() {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return GestureDetector(
          onTap: () => null,
          child: new Material(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.only(
                topLeft: new Radius.circular(15.0),
                topRight: new Radius.circular(15.0),
              ),
            ),
            child: Container(height: height, child: child),
          ),
        );
      },
    );
  }
}
