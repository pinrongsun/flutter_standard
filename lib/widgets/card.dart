import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Function onPress;
  final Widget left;
  final Widget right;
  final Widget content;
  final double elevation;
  final EdgeInsets edgeInsets;
  CustomCard({
    this.onPress,
    this.elevation: 4,
    this.left,
    this.right,
    this.edgeInsets: const EdgeInsets.all(10),
    @required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.0),
      child: Stack(
        children: <Widget>[
          // /// Item Grid Card
          //   alignment: Alignment.topCenter,
          //   child: SizedBox.fromSize(
          //     size: Size.fromHeight(height),
          //     child: Stack(
          //       fit: StackFit.expand,
          //       children: <Widget>[
          //         Container(
          //           margin: EdgeInsets.only(left: 10.0, right: 10.0),
          Material(
            elevation: elevation,
            borderRadius: BorderRadius.circular(10.0),
            shadowColor: Colors.black38,
            color: Colors.white,
            child: InkWell(
              onTap: onPress,
              borderRadius: BorderRadius.circular(10.0),
              child: Padding(
                padding: edgeInsets,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    left != null
                        ? Align(
                            alignment: Alignment.centerLeft,
                            child: left,
                          )
                        : Container(),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10),
                        child: content,
                      ),
                    ),
                    right != null
                        ? Align(
                            alignment: Alignment.centerRight,
                            child: right,
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
          ),
          // ),
          // ],
          // ),
          // ),
          // ),
        ],
      ),
    );
  }
}
