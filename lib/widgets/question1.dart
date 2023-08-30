import 'package:flutter/material.dart';
import 'package:quiz_app/models/title_question.dart';
import 'package:quiz_app/screens/quiz_screens/quiz_screen_1.dart';
import 'package:quiz_app/widgets/countinue_quiz.dart';
import 'package:quiz_app/widgets/questions.dart';
import 'package:quiz_app/widgets/start_quiz_button.dart';

class Question1 extends StatefulWidget {
  const Question1({
    super.key,
  });

  @override
  State<Question1> createState() => _Question1State();
}

class _Question1State extends State<Question1> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Question(
              text: 'Question 1.1',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => QuizScreen(),
                ));
              },
            ),
            const SizedBox(height: 20),
            Question(
              text: 'Question 1.2',
              onTap: () {},
            ),
            const SizedBox(height: 10),
            const Text(
              'Countinue Quiz',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            const SizedBox(height: 10),
            const CountinueQuiz(),
            const SizedBox(height: 25),
            const StartQuizButton(),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
