import 'package:flutter/material.dart';
import 'package:advance_quiz/data/questions.dart';
import 'package:advance_quiz/question_summary/question_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.choosenAnswer, required this.restartQuiz});

  final List<String> choosenAnswer;
  final void Function() restartQuiz;

  // USING METHOD
  // List<Map<String, Object>> getSummaryData() {
  //   final List<Map<String, Object>> summary = [];

  //   for (var i = 0; i < choosenAnswer.length; i++) {
  //     summary.add(
  //       {
  //         'question_index': i,
  //         'question': questions[i].text,
  //         'correct_answer': questions[i].answers[0],
  //         'user_answer': choosenAnswer[i]
  //       },
  //     );
  //   }
  //   return summary;
  // }

  // Using Getter
  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswer.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': choosenAnswer[i]
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;

    // NOT USING ARROW FUNCTION
    // final correctTotalQuestion = summaryData.where((data) {
    //   return data['user_answer'] == data['correct_answer'];
    // }).length; // Filter the original list from a Map

    // Using Arrow Function
    final correctTotalQuestion = summaryData
        .where(
          (data) => data['user_answer'] == data['correct_answer'],
        )
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $correctTotalQuestion out of $numTotalQuestions correctly!',
              style: GoogleFonts.poppins(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summaryData),
            Container(
              height: 30,
            ),
            ElevatedButton.icon(
              onPressed: restartQuiz,
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 0, 0, 0)),
              icon: const Icon(Icons.refresh,
                  color: Color.fromARGB(255, 255, 255, 255)),
              label: const Text(
                'Restart Quiz!',
                style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
