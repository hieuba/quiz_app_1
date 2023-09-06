import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/constants/padding.dart';
import 'package:quiz_app/commons/question_and_minute.dart';
import 'package:quiz_app/constants/theme_data.dart';
import 'package:quiz_app/data/generate_map.dart';
import 'package:quiz_app/models/exam_model.dart';

class QuestionMotoBike extends StatelessWidget {
  const QuestionMotoBike({
    super.key,
    required this.examModel,
  });

  final ExamModel examModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kHPadding,
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
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
                margin: EdgeInsets.only(left: 23.w, right: 12.w),
                width: 72.w,
                height: 72.h,
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage(examModel.thumnail))),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GradientText(
                      text: examModel.title.toString(),
                      gradient: textGradient,
                      textStyle: GoogleFonts.ubuntu(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    QuestionAndMinute(
                      image: 'assets/icons/number_question.png',
                      text: '${examModel.total_question} Câu hỏi',
                    ),
                    QuestionAndMinute(
                      image: 'assets/icons/timer.png',
                      text: convertSecondsToMinutes(examModel.time.toString()),
                    ),
                    SizedBox(height: 5.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
