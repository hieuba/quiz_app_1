// class QuizQuestion {
//   final String text;
//   final List<String> answer;

//   QuizQuestion(this.text, this.answer);
// // get shuffle {} ... // getter
//   getSuffleList() {
//     // tạo ra 1 giá trị giông answer sau đó shuffle
//     final shuffleList = [...answer];
//     answer.shuffle();
//     return shuffleList;
//   }
// }

class QuestionModel {
  final String questionText;
  final List<String> options;
  final int correctOptionIndex;

  QuestionModel(
      {required this.questionText,
      required this.options,
      required this.correctOptionIndex});

  getSuffleList() {
    // tạo ra 1 giá trị giông answer sau đó shuffle
    final shuffleList = [...options];
    options.shuffle();
    return shuffleList;
  }
}
