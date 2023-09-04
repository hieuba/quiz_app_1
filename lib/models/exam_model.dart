import 'package:quiz_app/models/question_model.dart';

class ExamModel {
  final List<QuestionModel> questions;
  final int time;
  final String? description;
  final Category category;
  final String id;
  final String title;
  final int total_question;

  ExamModel({
    required this.questions,
    required this.time,
    this.description,
    required this.category,
    required this.id,
    required this.title,
    required this.total_question,
  });
}

enum Category { xeMay, oto }
