import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/screens/quiz_screens/quiz_screen_1.dart';
import 'package:quiz_app/commons/countinue_quiz.dart';
import 'package:quiz_app/commons/questions.dart';
import 'package:quiz_app/commons/start_quiz_button.dart';

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
      padding: EdgeInsets.only(top: 21.h, left: 24.w, right: 24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Question(
                  text: 'Question 1.1',
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const QuizScreen(),
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
              ],
            ),
          )),
          const StartQuizButton(),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
