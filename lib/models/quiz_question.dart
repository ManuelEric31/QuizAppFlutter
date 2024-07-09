class QuizQuestion {
  const QuizQuestion (this.text, this.answers);

  final String text;
  final List <String> answers;

  // Using Getter Method (Optional)
  List <String> get shuffledAnswer {
    // List.of is an build method from flutter to copy value to another variable 
    // we need it because the shuffle function does change the original value of list
    // So we won' to do that
    final shuffledAnswer = List.of(answers);
    shuffledAnswer.shuffle();
    return shuffledAnswer;
  }
}