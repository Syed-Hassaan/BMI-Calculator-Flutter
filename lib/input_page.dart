import 'package:bmi_calculator/constantFile.dart';
import 'package:bmi_calculator/resultFile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'boxcontainerfile.dart';
import 'icontextwidgetfile.dart';
import 'constantFile.dart';
import 'resultFile.dart';
import 'bmi_brain.dart';

int sliderHeight = 180;
int sliderWeight = 60;
int sliderAge = 20;

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectGender = Gender.male;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEB1555),
        title: Text("BMI Calculator"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: RepeatedBoxContainer(
                    onPressed: () {
                      setState(() {
                        selectGender = Gender.male;
                      });
                    },
                    colors: selectGender == Gender.male
                        ? activeColor
                        : deActiveColor,
                    cardWidget: RepeatIconTextWidget(
                      iconData: FontAwesomeIcons.male,
                      label: "MALE",
                    ),
                  ),
                ),
                Expanded(
                  child: RepeatedBoxContainer(
                    onPressed: () {
                      setState(() {
                        selectGender = Gender.female;
                      });
                    },
                    colors: selectGender == Gender.female
                        ? activeColor
                        : deActiveColor,
                    cardWidget: RepeatIconTextWidget(
                      iconData: FontAwesomeIcons.female,
                      label: "FEMALE",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: RepeatedBoxContainer(
              colors: Color(0xFF1D1E33),
              cardWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: klabelStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        sliderHeight.toString(),
                        style: kNumberStyle,
                      ),
                      Text(
                        "cm",
                        style: klabelStyle,
                      )
                    ],
                  ),
                  Slider(
                    value: sliderHeight.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    activeColor: Color(0xFFEB1555),
                    inactiveColor: Color(0xFF8D8E98),
                    onChanged: (double newValue) {
                      setState(() {
                        sliderHeight = newValue.round();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: RepeatedBoxContainer(
                    colors: Color(0xFF1D1E33),
                    cardWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("WEIGHT", style: klabelStyle),
                        Text(
                          sliderWeight.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            roundIcon(
                                iconData: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    sliderWeight--;
                                  });
                                }),
                            SizedBox(
                              width: 10.0,
                            ),
                            roundIcon(
                                iconData: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    sliderWeight++;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: RepeatedBoxContainer(
                    colors: Color(0xFF1D1E33),
                    cardWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("AGE", style: klabelStyle),
                        Text(
                          sliderAge.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            roundIcon(
                                iconData: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    sliderAge--;
                                  });
                                }),
                            SizedBox(
                              width: 10.0,
                            ),
                            roundIcon(
                                iconData: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    sliderAge++;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: sliderHeight, weight: sliderWeight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultScreen(
                            bmiResult: calc.CalculateBMI(),
                            bmiText: calc.getResult(),
                            interpretation: calc.getInterpretation(),
                          )));
            },
            child: Container(
              child: Center(
                child: Text(
                  "Calculate",
                  style: kLargeButtonStyle,
                ),
              ),
              color: Color(0xFFEB1555),
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: 80.0,
            ),
          ),
        ],
      ),
    );
  }
}

class roundIcon extends StatelessWidget {
  final IconData iconData;
  final void Function() onPress;

  roundIcon({required this.iconData, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(iconData),
      onPressed: onPress,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        height: 56.0,
        width: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
