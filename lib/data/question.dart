import 'package:bmi_calculator/model/bmi_question.dart';

final question = [
  BMIQuestion(
      question: "What is your Height in cm.",
      options: [for (var i = 0; i < 200; i++) i.toString()]),
  BMIQuestion(
      question: "What is your Weight in kg.",
      options: [for (var i = 0; i < 130; i++) i.toString()]),
];
