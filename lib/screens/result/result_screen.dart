import 'package:flutter/material.dart';
import 'package:quiz_app/constants/padding.dart';
import 'package:quiz_app/constants/theme_data.dart';
import 'package:quiz_app/models/quiz_question.dart';

class ResutlScreen extends StatelessWidget {
  const ResutlScreen({
    super.key,
    required this.totalQuestions,
    required this.correctAnswers,
    required this.questions,
    required this.userAnswers,
  });

  final int totalQuestions;
  final int correctAnswers;

  final List<QuestionModel> questions;
  final Map<int, dynamic> userAnswers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // layout
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff0083ff),
              Color(0xff87ceff),
            ],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // tabbar
            Padding(
              padding: kPadding,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('/');
                    },
                    child: Icon(
                      Icons.home_outlined,
                      color: whiteColor,
                    ),
                  ),
                  Text(
                    'Result Quiz',
                    style: TextStyle(
                        fontSize: kTitleFontSize,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            // body
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // questions index and questions list
                        Text(
                          'Total Questions: $totalQuestions',
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Correct Answers: $correctAnswers',
                          style: const TextStyle(fontSize: 20),
                        ),

                        Text('Ban duoc 9 diem $correctAnswers voi thoi gian: '),

                        const SizedBox(height: 20),
                        for (int i = 0; i < questions.length; i++)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Question ${i + 1}: ${questions[i].questionText}',
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Correct Answer: ${questions[i].options[questions[i].correctOptionIndex]}',
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.blue),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Your Answer: ${userAnswers.containsKey(i) ? (userAnswers[i] != null ? questions[i].options[userAnswers[i]!] : 'Not answered') : 'Not answered'}',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: (userAnswers[i] != null
                                                ? questions[i]
                                                    .options[userAnswers[i]!]
                                                : 'Not answered') ==
                                            questions[i].options[
                                                questions[i].correctOptionIndex]
                                        ? Colors.blue
                                        : Colors.red),
                              ),
                              const SizedBox(height: 16),
                            ],
                          ),
                        // buttons
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
