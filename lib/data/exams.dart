import 'package:quiz_app/data/de_a1.dart';
import 'package:quiz_app/models/exam_model.dart';

class ExamData {
  static List<Map<String, dynamic>> exams = [
    {
      "id": "1",
      "time": 900,
      "description": "day la de thi a1",
      "category": Category.xeMay,
      "questions": deA1,
      "title": "Bằng lái A1",
      "total_question": deA1.length,
      "thumnail": 'assets/images/a1.png'
    },
  ];
}
