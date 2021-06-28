import 'package:flutter/material.dart';

class RectangleButton extends StatelessWidget {
  final String buttonTitle;
  final Function onPressed;

  RectangleButton({this.buttonTitle, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10.0,
      color: Colors.cyan,
      borderRadius: BorderRadius.circular(25.0),
      child: MaterialButton(
        padding: EdgeInsets.all(20.0),
        child: Center(
            child: Text(
          buttonTitle,
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        )),
        onPressed: onPressed,
      ),
    );
  }
}
