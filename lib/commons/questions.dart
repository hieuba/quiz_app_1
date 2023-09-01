import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/constants/padding.dart';
import 'package:quiz_app/commons/question_and_minute.dart';
import 'package:quiz_app/constants/theme_data.dart';

class Question extends StatelessWidget {
  const Question({
    super.key,
    required this.onTap,
    required this.text,
  });

  final void Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: kBorderRadius,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: kHPadding,
                width: 72.w,
                height: 72.h,
                decoration: BoxDecoration(color: grayColor),
              ),
              SizedBox(width: 16.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GradientText(
                    text: text,
                    gradient: textGradient,
                    textStyle: GoogleFonts.ubuntu(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const QuestionAndMinute(
                    image: 'assets/icons/number_question.png',
                    text: '10 Questions',
                  ),
                  const QuestionAndMinute(
                    image: 'assets/icons/timer.png',
                    text: '10 mins',
                  ),
                ],
              ),
              const Spacer(),
              const Center(
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Text('4.8')
                  ],
                ),
              ),
              const SizedBox(width: 12)
            ],
          ),
        ),
      ),
    );
  }
}
