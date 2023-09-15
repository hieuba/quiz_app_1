import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:quiz_app/commons/appbar_custom.dart';
import 'package:quiz_app/commons/show_dialog_custom.dart';
import 'package:quiz_app/constants/padding.dart';
import 'package:quiz_app/constants/theme_data.dart';
import 'package:quiz_app/models/question_model.dart';
import 'package:quiz_app/screens/home_page.dart';

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

  Future<bool> _onWillPop(BuildContext context) async {
    return (await showDialog(
            context: context,
            builder: (context) => DialogCustom(
                done: () {
                  Navigator.of(context).popAndPushNamed('/');
                },
                cancle: () {
                  Navigator.of(context).pop();
                },
                title: 'Thông báo',
                content: 'Bạn có muốn thoát không?'))) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    return WillPopScope(
      onWillPop: () {
        return _onWillPop(context);
      },
      child: Scaffold(
        // layout
        body: SafeArea(
          top: false,
          bottom: false,
          child: Container(
            decoration: BoxDecoration(
              gradient: appBarGradient,
            ),
            child: Column(
              children: [
                // tabbar
                Padding(
                  padding: EdgeInsets.only(
                      bottom: kSpacing,
                      left: kSpacing,
                      right: kSpacing,
                      top: topPadding),
                  child: AppBarCustom(
                      title: 'Kết quả',
                      icon: 'back.png',
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            child: const HomePage(),
                            type: PageTransitionType.topToBottom,
                          ),
                        );
                      },
                      widget: Container(
                        height: 30.h,
                        width: 75.w,
                        decoration: BoxDecoration(
                            color: whiteColor, borderRadius: kBorderRadius),
                        child: Center(
                          child: correctAnswers >= 21
                              ? Text(
                                  'Đạt',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: blueColor,
                                  ),
                                )
                              : Text(
                                  'Không Đạt',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: errorColor),
                                ),
                        ),
                      )),
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
                          Padding(
                            padding: EdgeInsets.only(bottom: kSpacing),
                            child: Container(
                              padding: kHPadding,
                              decoration: BoxDecoration(
                                  gradient: appBarGradient,
                                  borderRadius: kBorderRadius),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                      text:
                                          '${totalQuestions - correctAnswers}'),
                                  // SizedboxInfo(
                                  //     image: 'assets/icons/info.png', text: '123')
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: List.generate(questions.length, (i) {
                                  final correctAnswer = questions[i]
                                      .options[questions[i].correctOptionIndex];

                                  final isLastItem = i == questions.length - 1;
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Câu hỏi ${i + 1}: ${questions[i].questionText}',
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500,
                                            color: blackColor),
                                      ),
                                      SizedBox(height: 8.h),
                                      Text(
                                        'Đáp án: $correctAnswer',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: blueColor,
                                        ),
                                      ),
                                      SizedBox(height: 4.h),
                                      Text(
                                        'Bạn chọn: ${userAnswers.containsKey(i) ? (userAnswers[i] != null ? questions[i].options[userAnswers[i]!] : 'Bạn chưa chọn đáp án') : 'Bạn chưa chọn đáp án'}',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: (userAnswers[i] != null
                                                      ? questions[i].options[
                                                          userAnswers[i]!]
                                                      : 'Bạn chưa chọn đáp án') ==
                                                  questions[i].options[
                                                      questions[i]
                                                          .correctOptionIndex]
                                              ? blueColor
                                              : errorColor,
                                        ),
                                      ),
                                      if (!isLastItem)
                                        Divider(
                                          color: grayColor,
                                        ),
                                    ],
                                  );
                                }),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
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

var textStye = TextStyle(
  fontSize: 16.sp,
  fontWeight: FontWeight.w500,
  color: whiteColor,
);
