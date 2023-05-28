import 'package:bmi_calculator/data/question.dart';
import 'package:bmi_calculator/option_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  final void Function(String option) onSelectOption;
  const QuestionScreen({
    super.key,
    required this.onSelectOption,
  });

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedoption) {
    widget.onSelectOption(selectedoption);
    setState(() {
      currentQuestionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentOption = question[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 180,
        ),
        child: Column(
          children: [
            Text(
              currentOption.question,
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 201, 153, 251),
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 400,
              child: ListView(
                children: [
                  ...currentOption.options.map(
                    (data) {
                      return OptionButton(
                          optionText: data,
                          onTap: () {
                            answerQuestion(data);
                          });
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
