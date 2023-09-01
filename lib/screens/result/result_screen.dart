import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
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
    required this.totalTime,
  });

  final int totalQuestions;
  final int correctAnswers;
  final int totalTime;

  final List<QuestionModel> questions;
  final Map<int, dynamic> userAnswers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // layout
      body: Container(
        decoration: BoxDecoration(
          gradient: appBarGradient,
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
                    'Kết quả',
                    style: titleStyte,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            gradient: appBarGradient,
                            borderRadius: kBorderRadius),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedboxInfo(
                                image: 'assets/icons/t.png',
                                text: formatTime(totalTime)),
                            SizedboxInfo(
                              text: '$totalQuestions',
                              image: 'assets/icons/total.png',
                            ),
                            SizedboxInfo(
                                image: 'assets/icons/v.png',
                                text: '$correctAnswers'),
                            SizedboxInfo(
                                image: 'assets/icons/x.png',
                                text: '${totalQuestions - correctAnswers}'),
                            SizedboxInfo(
                                image: 'assets/icons/info.png', text: '123')
                          ],
                        ),
                      ),

                      Expanded(
                          child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                            questions.length,
                            (i) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Question ${i + 1}: ${questions[i].questionText}',
                                  style: GoogleFonts.ubuntu(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                Text(
                                  'Correct Answer: ${questions[i].options[questions[i].correctOptionIndex]}',
                                  style: GoogleFonts.ubuntu(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: blueColor,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  'Your Answer: ${userAnswers.containsKey(i) ? (userAnswers[i] != null ? questions[i].options[userAnswers[i]!] : 'Not answered') : 'Not answered'}',
                                  style: GoogleFonts.ubuntu(
                                    fontSize: 14.sp,
                                    color: (userAnswers[i] != null
                                                ? questions[i]
                                                    .options[userAnswers[i]!]
                                                : 'Not answered') ==
                                            questions[i].options[
                                                questions[i].correctOptionIndex]
                                        ? blueColor
                                        : errorColor,
                                  ),
                                ),
                                Divider(
                                  color: grayColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),

                      // buttons
                    ],
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

class SizedboxInfo extends StatelessWidget {
  const SizedboxInfo({
    super.key,
    required this.image,
    required this.text,
  });

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.black12,
      height: 40.h,
      child: Row(
        children: [
          SizedBox(height: 20.h, width: 20.w, child: Image.asset(image)),
          Text(
            text,
            style: textStye,
          ),
        ],
      ),
    );
  }
}

String formatTime(int seconds) {
  int minutes = (seconds / 60).floor();
  int remainingSeconds = seconds % 60;
  return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
}

var textStye = GoogleFonts.ubuntu(
  fontSize: 16.sp,
  fontWeight: FontWeight.w500,
  color: whiteColor,
);
