import 'package:bmi_calculator/constantFile.dart';
import 'package:flutter/material.dart';
import 'constantFile.dart';

class RepeatIconTextWidget extends StatelessWidget {
  final IconData iconData;
  final String label;
  RepeatIconTextWidget({required this.iconData, required this.label});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          color: Colors.white,
          size: 85.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: klabelStyle,
        )
      ],
    );
  }
}
