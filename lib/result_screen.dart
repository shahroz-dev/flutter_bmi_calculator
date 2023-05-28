import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

class ResultScreen extends StatelessWidget {
  final List<String> chosenoptions;
  final void Function() restartCalculation;

  const ResultScreen({
    super.key,
    required this.chosenoptions,
    required this.restartCalculation,
  });

  String weightCategory(double bmi) {
    if (bmi <= 18.4) {
      return "Underweight";
    } else if (18.5 <= bmi && bmi <= 24.9) {
      return "Normal";
    } else if (25 <= bmi && bmi <= 39.9) {
      return "Overweight";
    } else {
      return "Obese";
    }
  }

  @override
  Widget build(BuildContext context) {
    final BMI =
        int.parse(chosenoptions[1]) / pow(int.parse(chosenoptions[0]) / 100, 2);

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your BMI is ${BMI.toStringAsFixed(2)}",
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              "You are in " + weightCategory(BMI) + " Category",
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            TextButton.icon(
              onPressed: restartCalculation,
              icon: const Icon(Icons.refresh_outlined),
              label: Text(
                'Restart Calculation!',
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              style: TextButton.styleFrom(
                iconColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
