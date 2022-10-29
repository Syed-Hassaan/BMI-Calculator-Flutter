import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/material.dart';
import 'boxcontainerfile.dart';
import 'constantFile.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen(
      {required this.bmiResult,
      required this.bmiText,
      required this.interpretation});
  final String bmiResult;
  final String bmiText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEB1555),
        title: Text("BMI Result"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              child: Center(
                child: Text(
                  "Result",
                  style: kStyleS2,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: RepeatedBoxContainer(
              colors: activeColor,
              cardWidget: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(bmiText, style: kResultText),
                  Text(bmiResult, style: kBMITextStyle),
                  Padding(
                    padding: EdgeInsets.only(left: 12.0, right: 12.0),
                    child: Text(interpretation,
                        textAlign: TextAlign.center, style: kBodyTextStyle),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => InputPage()));
              },
              child: Container(
                child: Center(
                  child: Text(
                    "Re-Calculate",
                    style: kLargeButtonStyle,
                  ),
                ),
                color: Color(0xFFEB1555),
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: 80.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
