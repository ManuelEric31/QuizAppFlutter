import 'package:advance_quiz/question_screen.dart';
import 'package:flutter/material.dart';
import 'package:advance_quiz/start_container_quiz.dart';
import 'package:advance_quiz/data/questions.dart';
import 'package:advance_quiz/result_screen.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

// Underscore means private
class _QuizState extends State<Quiz> {
  // Use Widget Variable instead of var, passes the switcchScreen to parameter to Recognize from the StartContainerQuiz
  // Widget? activeScreen;
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  // Must use this initState to guarantee switchScreen function that can use earlier
  // This state was executed first before the build method runs
  // @override
  // void initState() {
  //   activeScreen = StartContainerQuiz(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    selectedAnswers = [];
    setState(() {
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidgetNow = StartContainerQuiz(switchScreen);

    if (activeScreen == 'question-screen') {
      screenWidgetNow = QuestionScreen(onSelectAnswer: chooseAnswer);
    }

    if (activeScreen == 'results-screen') {
      screenWidgetNow = ResultsScreen(
        choosenAnswer: selectedAnswers,
        restartQuiz: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 255, 255, 255),
                Color.fromARGB(255, 255, 255, 255),
                Color.fromARGB(255, 255, 255, 255),
              ],
              begin: startAlignment,
              end: endAlignment,
            ),
          ),
          child: screenWidgetNow,
        ),
      ),
    );
  }
}
