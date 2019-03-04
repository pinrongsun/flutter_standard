import 'package:flutter/material.dart';
import '../utils/constants.dart';

class GradientButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  final String text;
  final bool round;

  GradientButton(
      {@required this.onPressed, @required this.text, this.round = false});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      color: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(round ? 50.0 : 8.0),
        ),
      ),
      child: InkWell(
        onTap: onPressed,
        child: Ink(
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),,
            gradient: LinearGradient(
              colors: Constants.colors.gradients,
            ),
          ),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
