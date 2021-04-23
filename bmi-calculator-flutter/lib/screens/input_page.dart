import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reuseable_card.dart';
import '../constants.dart';
import '../screens//results_page.dart';
import '../components/bottom_button.dart';
import '../components/round_icon_button.dart';
import 'package:bmi_calculator/calcuator_brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  double height = 180;
  int weight = 70;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildGenderCards(),
          _buildSliderCard(context),
          Expanded(
            child: Row(
              children: [
                _buildWeightCard(),
                _buildAgeCard(),
              ],
            ),
          ),
          _buildBottomButton(context)
        ],
      ),
    );
  }

  Widget _buildAgeCard() {
    return Expanded(
      child: ReuseableCard(
        color: kActiveCardColor,
        cardChild: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'AGE',
              style: kLabelTextStyle,
            ),
            Text(
              age.toString(),
              style: kNumberTextStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundIconButton(
                  icon: FontAwesomeIcons.minus,
                  onPress: () {
                    setState(() {
                      age--;
                    });
                  },
                ),
                SizedBox(
                  width: 10.0,
                ),
                RoundIconButton(
                  icon: FontAwesomeIcons.plus,
                  onPress: () {
                    setState(() {
                      age++;
                    });
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildWeightCard() {
    return Expanded(
      child: ReuseableCard(
        color: kActiveCardColor,
        cardChild: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'WEIGHT',
              style: kLabelTextStyle,
            ),
            Text(
              weight.toString(),
              style: kNumberTextStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundIconButton(
                  icon: FontAwesomeIcons.minus,
                  onPress: () {
                    setState(() {
                      weight--;
                    });
                  },
                ),
                SizedBox(
                  width: 10.0,
                ),
                RoundIconButton(
                  icon: FontAwesomeIcons.plus,
                  onPress: () {
                    setState(() {
                      weight++;
                    });
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBottomButton(BuildContext context) {
    return BottomButton(
      buttonTitle: 'CALCULATE',
      onTap: () {
        CalculatorBrain calc =
            CalculatorBrain(height: height.toInt(), weight: weight);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultsPage(
              bmiResult: calc.getBMI(),
              resultText: calc.getResult(),
              interpretation: calc.getInterpretation(),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSliderCard(BuildContext context) {
    return Expanded(
      child: ReuseableCard(
        color: kActiveCardColor,
        cardChild: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'HEIGHT',
              style: kLabelTextStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  height.toInt().toString(),
                  style: kNumberTextStyle,
                ),
                Text(
                  'cm',
                  style: kLabelTextStyle,
                )
              ],
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                  inactiveTrackColor: Color(0xFF8D8E98),
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                  thumbColor: Color(0xFFEB1555),
                  activeTrackColor: Colors.white,
                  overlayColor: Color(0x29EB1555)),
              child: Slider(
                value: height,
                min: 120.0,
                max: 220.0,
                onChanged: (double newValue) {
                  setState(() {
                    height = newValue;
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildGenderCards() {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: ReuseableCard(
              onPress: () {
                setState(() {
                  selectedGender = Gender.male;
                });
              },
              color: selectedGender == Gender.male
                  ? kActiveCardColor
                  : kInactiveCardColor,
              cardChild: IconContent(
                icon: FontAwesomeIcons.mars,
                label: 'MALE',
              ),
            ),
          ),
          Expanded(
            child: ReuseableCard(
              onPress: () {
                setState(() {
                  selectedGender = Gender.female;
                });
              },
              color: selectedGender == Gender.female
                  ? kActiveCardColor
                  : kInactiveCardColor,
              cardChild: IconContent(
                icon: FontAwesomeIcons.venus,
                label: 'FEMALE',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
