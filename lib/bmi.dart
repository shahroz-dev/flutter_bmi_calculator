import 'package:bmi_calculator/data/question.dart';
import 'package:bmi_calculator/question-screen.dart';
import 'package:bmi_calculator/result_screen.dart';
import 'package:bmi_calculator/start_screen.dart';
import 'package:flutter/material.dart';

class BMI extends StatefulWidget {
  const BMI({super.key});

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  List<String> selectedOption = [];
  var activeScreen = "start-screen";

  void restartCalculation() {
    setState(() {
      selectedOption = [];
      activeScreen = 'calculation-screen';
    });
  }

  void chooseoption(String option) {
    selectedOption.add(option);

    if (selectedOption.length == question.length) {
      setState(() {
        activeScreen = "result-screen";
      });
    }
  }

  void switchScreen() {
    setState(() {
      activeScreen = "calculation-screen";
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(
      switchScreen: switchScreen,
    );

    if (activeScreen == "calculation-screen") {
      screenWidget = QuestionScreen(
        onSelectOption: chooseoption,
      );
    }

    if (activeScreen == "result-screen") {
      screenWidget = ResultScreen(
        chosenoptions: selectedOption,
        restartCalculation: restartCalculation,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(183, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
