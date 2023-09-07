import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/commons/question_and_minute.dart';
import 'package:quiz_app/constants/padding.dart';
import 'package:quiz_app/constants/theme_data.dart';

class CountinueQuestion extends StatelessWidget {
  const CountinueQuestion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 112.h,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 112.h,
            width: 112.w,
            decoration: BoxDecoration(
              color: grayColor,
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GradientText(
                          text: 'Animation',
                          gradient: textGradient,
                          textStyle: buttonStyle,
                        ),
                        const QuestionAndMinute(
                          image: 'assets/icons/number_question.png',
                          text: '10 Questions',
                        ),
                        const QuestionAndMinute(
                          image: 'assets/icons/timer.png',
                          text: '10 mins',
                        ),
                        SizedBox(height: 16.h),
                        // countinue Quiz
                      ],
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: SizedBox(
                        height: 18.h,
                        width: 18.w,
                        child: Image.asset('assets/icons/delete.png'),
                      ),
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: 32.h,
                  decoration: BoxDecoration(
                    color: blackColor,
                    borderRadius: kBorderRadius,
                  ),
                  child: Center(
                    child: Text(
                      'Countinue Quiz',
                      style: buttonStyle,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
