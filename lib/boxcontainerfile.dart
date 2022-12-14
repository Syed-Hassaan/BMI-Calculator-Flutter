import 'package:flutter/material.dart';

class RepeatedBoxContainer extends StatelessWidget {
  final Color colors;
  final Widget cardWidget;
  final onPressed;
  RepeatedBoxContainer(
      {required this.colors, required this.cardWidget, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.all(15.0),
        child: cardWidget,
        decoration: BoxDecoration(
          color: colors,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
