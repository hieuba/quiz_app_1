import 'dart:math';

Map<int, dynamic> generateMap(int n) {
  Map<int, dynamic> value = {};
  for (int i = 0; i < n; i++) {
    value[i] = null;
  }
  return value;
}

// Hàm chuyển đổi thời gian từ giây sang phút
String convertSecondsToMinutes(String seconds) {
  int secondsValue = int.parse(seconds);
  int minutes = secondsValue ~/ 60; // Lấy phần nguyên

  return '$minutes phút';
}

// Hàm để xáo trộn danh sách câu hỏi
List shuffleQuestions(List inputQuestions) {
  var random = Random();
  var questions = List.from(inputQuestions);
  for (var i = questions.length - 1; i > 0; i--) {
    var j = random.nextInt(i + 1);
    var temp = questions[i];
    questions[i] = questions[j];
    questions[j] = temp;
  }
  return questions;
}
