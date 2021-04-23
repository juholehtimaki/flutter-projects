import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;

  double _bmi;

  CalculatorBrain({this.height, this.weight}) {
    _bmi = weight / pow(height / 100, 2);
  }

  String getBMI() {
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    _bmi = weight / pow(height / 100, 2);
    if (_bmi < 18.5)
      return 'Underweight';
    else if (_bmi <= 24.9)
      return 'Normal weight';
    else if (_bmi <= 29.9)
      return 'Overweight';
    else
      return 'Obesity';
  }

  String getInterpretation() {
    if (_bmi < 18.5)
      return 'You have a lower than normal body weight. You can eat a bit more.';
    else if (_bmi >= 18.5 && _bmi <= 24.9)
      return 'You have a normal body weight. Good job!';
    else if (_bmi >= 25.0 && _bmi <= 29.9)
      return 'You have a higher than normal body weight. Try to exercise more.';
    else
      return 'You have a lot higher than normal body weight. Try to lose some weight via proper diet.';
  }
}
