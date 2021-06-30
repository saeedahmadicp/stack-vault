import 'package:flutter/material.dart';

class PressButton extends StatelessWidget {
  final String buttonTitle;
  final Function onPressed;

  PressButton({this.buttonTitle, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8.0,
      color: Colors.cyan,
      borderRadius: BorderRadius.circular(30.0),
      child: MaterialButton(
        child: Text(
          buttonTitle,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
