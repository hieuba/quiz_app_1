import 'package:quiz_app/models/question_model.dart';

class ExamModel {
  List<QuestionModel> questions;
  final int time;
  final String? description;
  final Category category;
  final String id;
  final String title;
  final int total_question;
  final String thumnail;

  ExamModel({
    required this.questions,
    required this.time,
    this.description,
    required this.category,
    required this.id,
    required this.title,
    required this.total_question,
    required this.thumnail,
  });

  factory ExamModel.fromMap(Map<String, dynamic> map) {
    return ExamModel(
      id: map['id'],
      time: map['time'],
      description: map['description'],
      category: map['category'],
      questions: map['questions'],
      title: map['title'],
      total_question: map['total_question'],
      thumnail: map['thumnail'],
    );
  }
}

enum Category { xeMay, oto, math }
