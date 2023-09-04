import 'package:quiz_app/data/a1.dart';
import 'package:quiz_app/data/a2.dart';
import 'package:quiz_app/models/exam_model.dart';

class ExamData {
  static List<Map<String, dynamic>> exams = [
    {
      "id": "1",
      "time": 900,
      "description": "day la de thi a1",
      "category": Category.xeMay,
      "questions": questionsA1,
      "title": "Bằng A1",
      "total_question": questionsA1.length,
    },
    {
      "id": "2",
      "time": 900,
      "description": "day la de thi a2",
      "category": Category.xeMay,
      "questions": questionsA2,
      "title": "Bằng A2",
      "total_question": questionsA2.length,
    },
  ];
}
