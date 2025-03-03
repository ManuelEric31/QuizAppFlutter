import 'package:advance_quiz/models/quiz_question.dart';

const questions = [
  QuizQuestion(
    'What are the main building blocks of Flutter UIs?',
    ['Widgets', 'Components', 'Blocks', 'Functions'],
  ),
  QuizQuestion(
    'How are the Flutter UIs built?',
    ['By combining widgets in code', 'By combining widgets in a visual editor', 'By defining widgets in config files', 'By using XCode for iOS and Android Studio for Android'],
  ),
  QuizQuestion(
    'Whats the purpose of a Stateful Widget',
    ['Update UI as data changes', 'Update data as UI changes', 'Ignore data changes', 'Render UI that does not depend on data'],
  ),
  QuizQuestion(
    'Which widget should you try to use more often: StatelessWidget or StatefulWidget?',
    ['Stateless Widget', 'Stateful Widget', 'Both are equally good', 'None of the above'],
  ),
  QuizQuestion(
    'What happens if you change data in a StatelessWidget?',
    ['The UI is not updated', 'The UI is updated', 'The closest StatefulWidget is updated', 'Any nested StatefulWidget are updated'],
  ),
  QuizQuestion(
    'How should you update data inside of StatefulWidget',
    ['By calling setState()', 'By calling updateData()', 'By calling updateUI()', 'By calling updateState()'],
  ),
];
