// next button
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/constants/theme_data.dart';
import 'package:quiz_app/screens/question_screens/questions_motobike_screen.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
    required this.objAnswers,
    required this.currentQuestionIndex,
    required this.widget,
  });

  final Map<int, dynamic> objAnswers;
  final int currentQuestionIndex;
  final QuestionMotoBikeScreen widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 50.w,
      decoration: BoxDecoration(
        gradient: objAnswers[currentQuestionIndex] != null &&
                !(currentQuestionIndex == widget.examModel.questions.length - 1)
            ? indexGradient
            : null,
        shape: BoxShape.circle,
        color: grayColor,
      ),
      child: Icon(
        Icons.arrow_forward_ios,
        color: whiteColor,
      ),
    );
  }
}
