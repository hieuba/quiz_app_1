import 'package:quiz_app/models/quiz_question.dart';

List<QuestionModel> questions = [
  QuestionModel(
    questionText: 'What is the capital of France?',
    options: ['Paris', 'Madrid', 'Ha noi', 'Rome'],
    correctOptionIndex: 0,
  ),
  QuestionModel(
    questionText: '1 + 1 = ?',
    options: ['2', '4', '3', '4'],
    correctOptionIndex: 0,
  ),
  QuestionModel(
    questionText: '2 + 7 = ?',
    options: ['4', '9', '5', '6'],
    correctOptionIndex: 1,
  ),
  QuestionModel(
    questionText: 'What is the capital of viet nam?',
    options: ['Paris', 'Madrid', 'Ha noi', 'Rome'],
    correctOptionIndex: 2,
  ),
  QuestionModel(
    questionText: '1 + 3 = ?',
    options: ['2', '14', '3', '4'],
    correctOptionIndex: 3,
  ),
  QuestionModel(
    questionText: '2 + 11 = ?',
    options: ['4', '9', '13', '6'],
    correctOptionIndex: 2,
  ),
  QuestionModel(
    questionText: 'What is the capital of thailand?',
    options: ['Paris', 'bangkok', 'Ha noi', 'Rome'],
    correctOptionIndex: 1,
  ),
  QuestionModel(
    questionText: '1 + 18 = ?',
    options: ['19', '4', '3', '4'],
    correctOptionIndex: 0,
  ),
  QuestionModel(
    questionText: '2 + 12 = ?',
    options: ['4', '9', '14', '6'],
    correctOptionIndex: 2,
  ),
  QuestionModel(
    questionText: '2 + 22 = ?',
    options: ['4', '9', '5', '24'],
    correctOptionIndex: 3,
  ),
];

Map<int, dynamic> generateMap(int n) {
  Map<int, dynamic> value = {};
  for (int i = 0; i < n; i++) {
    value[i] = null;
  }
  return value;
}
