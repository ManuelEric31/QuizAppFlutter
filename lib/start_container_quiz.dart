import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartContainerQuiz extends StatelessWidget {
  // Lifting State Up with passing parameter to void Function() startQuiz
  const StartContainerQuiz(this.startQuiz, {super.key});

  // final Color color1;
  // final Color color2;
  // final Color color3;
  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/quiz-logo.png',
              width: 240, color: const Color.fromARGB(255, 0, 0, 0)),
          // Opacity(
          //     opacity: 0.4,
          //     child: Image.asset('assets/images/quiz-logo.png', width: 290)),

          const SizedBox(height: 60),
          Text(
            'Learn Flutter in the Fun Way!',
            style: GoogleFonts.poppins(
                color: const Color.fromARGB(255, 0, 0, 0), fontSize: 20),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 143, 255, 192),
                backgroundColor: const Color.fromARGB(255, 0, 0, 0)),
            onPressed: startQuiz,
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}
