import 'package:flutter/material.dart';
import 'package:advance_quiz/question_summary/question_identifier.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData['user_answer'] == itemData['correct_answer'];
        
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionsIdentifier(
              isCorrectAnswer: isCorrectAnswer,
              questionIndex: itemData['question_index'] as int),
          // Typecasting to integer value because the Object didnot recognize the int since we have an Object in Map
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                itemData['question'] as String,
                style: GoogleFonts.poppins(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                itemData['user_answer'] as String,
                style: GoogleFonts.poppins(
                    color: const Color.fromARGB(255, 56, 12, 255)),
                textAlign: TextAlign.left,
              ),
              Text(
                itemData['correct_answer'] as String,
                style: GoogleFonts.poppins(
                  color: const Color.fromARGB(255, 2, 172, 115),
                ),
                textAlign: TextAlign.left,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
