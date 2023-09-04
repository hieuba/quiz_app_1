import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:quiz_app/commons/app_bar.dart';
import 'package:quiz_app/data/a1.dart';
import 'package:quiz_app/models/exam_model.dart';
import 'package:quiz_app/screens/detail/detail_screen.dart';
import 'package:quiz_app/screens/home_page.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

import 'package:quiz_app/constants/padding.dart';
import 'package:quiz_app/constants/theme_data.dart';
import 'package:quiz_app/data/generate_map.dart';
import 'package:quiz_app/models/question_model.dart';
import 'package:quiz_app/screens/result/result_screen.dart';

class QuestionMotoBikeScreen extends StatefulWidget {
  const QuestionMotoBikeScreen({
    super.key,
    required this.examModel,
  });

  final ExamModel examModel;

  @override
  // ignore: library_private_types_in_public_api
  _QuestionMotoBikeScreenState createState() => _QuestionMotoBikeScreenState();
}

class _QuestionMotoBikeScreenState extends State<QuestionMotoBikeScreen> {
  int currentQuestionIndex = 0;

  late int _totalTime;

  // final int _seconds = 900;

  final CountdownController _countdownController =
      CountdownController(autoStart: true);

  Map<int, dynamic> objAnswers = generateMap(0);

  // scrollController Index
  final ScrollController _scrollController = ScrollController();
  // total correct answers
  int calculateCorrectAnswers() {
    int correctAnsewers = 0;

    for (var i = 0; i < widget.examModel.questions.length; i++) {
      if (objAnswers.containsKey(i) &&
          objAnswers[i] == widget.examModel.questions[i].correctOptionIndex) {
        correctAnsewers++;
      }
    }
    return correctAnsewers;
  }

  // scroll index
  void scrollToIndex(int index) {
    if ((index >= 4 && index <= 21) || (index >= 3 && index <= 20)) {
      double screenWidth = MediaQuery.of(context).size.width;
      double itemWidth = (screenWidth - 2 * 30) / 7;

      double centerOffset =
          itemWidth * index + (itemWidth / 2) - ((screenWidth - 2 * 30) / 2);

      _scrollController.animateTo(
        centerOffset,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  // next question button
  void _nextQuestion() {
    var newIndex = currentQuestionIndex + 1;
    scrollToIndex(newIndex);
    setState(() {
      currentQuestionIndex = newIndex;
    });
  }

  // previous question button
  void _previousQuestion() {
    var newIndex = currentQuestionIndex - 1 > 0 ? currentQuestionIndex - 1 : 0;
    scrollToIndex(newIndex);
    setState(() {
      currentQuestionIndex = newIndex;
    });
  }

  // choose question index
  void _choseQuestionIndex(currentQuestIndex, answerIndex) {
    setState(() {
      objAnswers = {...objAnswers, currentQuestIndex: answerIndex};
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    QuestionModel currentQuestion =
        widget.examModel.questions[currentQuestionIndex];
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      // layout
      body: Container(
        decoration: BoxDecoration(
          gradient: appBarGradient,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 28.h),
            Padding(
              padding: EdgeInsets.only(
                bottom: 26.0.h,
                left: 26.w,
                right: 26.h,
              ),
              child: AppBarCustom(
                title: widget.examModel.title,
                icon: 'back.png',
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        // backgroundColor: grayColor,
                        title: const Text('Thông báo'),
                        content: const Text('Bạn có muốn thoát không?'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                _countdownController.pause();
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        child: HomePage(),
                                        type: PageTransitionType.topToBottom));
                              },
                              child: Text(
                                'Ok',
                                style: TextStyle(
                                  color: errorColor,
                                  fontWeight: FontWeight.w700,
                                ),
                              )),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'Bỏ qua',
                                style: TextStyle(
                                  color: blueColor,
                                  fontWeight: FontWeight.w700,
                                ),
                              )),
                        ],
                      );
                    },
                  );
                },
                widget: Container(
                  width: 72.w,
                  height: 24.h,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/icons/timer.png',
                        color: blueColor,
                      ),
                      Countdown(
                        controller: _countdownController,
                        seconds: widget.examModel.time,
                        build: (_, double time) {
                          _totalTime = widget.examModel.time - time.toInt();
                          int minutes = (time / 60).floor();
                          int seconds = (time % 60).floor();
                          return Text(
                            '$minutes:${seconds.toString().padLeft(2, '0')}',
                            style: GoogleFonts.ubuntu(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: blueColor,
                            ),
                          );
                        },
                        interval: const Duration(milliseconds: 1000),
                        onFinished: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return ResutlScreen(
                                totalTime: _totalTime,
                                totalQuestions:
                                    widget.examModel.questions.length,
                                correctAnswers: calculateCorrectAnswers(),
                                questions: questionsA1,
                                userAnswers: objAnswers,
                              );
                            },
                          ));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // tabbar
            /*
            Padding(
              padding: kVPadding,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Thong bao'),
                            content: const Text('Ban co muon thoat khong?'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    _countdownController.pause();
                                    Navigator.of(context).pushNamed('/');
                                  },
                                  child: const Text('Yes')),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('No')),
                            ],
                          );
                        },
                      );
                    },
                    child: Image.asset('assets/icons/back.png'),
                  ),
                  Text(widget.examModel.title, style: titleStyte),
                  
                  Container(
                    width: 72.w,
                    height: 24.h,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'assets/icons/timer.png',
                          color: blueColor,
                        ),
                        Countdown(
                          controller: _countdownController,
                          seconds: _seconds,
                          build: (_, double time) {
                            _totalTime = _seconds - time.toInt();
                            int minutes = (time / 60).floor();
                            int seconds = (time % 60).floor();
                            return Text(
                              '$minutes:${seconds.toString().padLeft(2, '0')}',
                              style: GoogleFonts.ubuntu(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: blueColor,
                              ),
                            );
                          },
                          interval: const Duration(milliseconds: 1000),
                          onFinished: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return ResutlScreen(
                                  totalTime: _totalTime,
                                  totalQuestions:
                                      widget.examModel.questions.length,
                                  correctAnswers: calculateCorrectAnswers(),
                                  questions: questionsA1,
                                  userAnswers: objAnswers,
                                );
                              },
                            ));
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
           */
            // body
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.r),
                  topRight: Radius.circular(25.r),
                ),
                child: Column(
                  children: [
                    // questions index and questions list
                    Expanded(
                      child: Container(
                        color: whiteColor,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 16.h),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: blueColor,
                                ),
                                height: 4.h,
                                width: 48.w,
                              ),
                            ),
                            // index questions
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              color: whiteColor,
                              height: 75.h,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      controller: _scrollController,
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                          widget.examModel.questions.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            scrollToIndex(index);
                                            setState(() {
                                              currentQuestionIndex = index;
                                            });
                                          },
                                          child: SizedBox(
                                            width: (width - 2 * 30) / 7,
                                            child: Center(
                                              child: Container(
                                                margin: const EdgeInsets.all(7),
                                                width: width / 7,
                                                decoration: BoxDecoration(
                                                  gradient: widget.examModel
                                                                  .questions[
                                                              index] ==
                                                          currentQuestion
                                                      ? indexGradient
                                                      : null,
                                                  shape: BoxShape.circle,
                                                  color: grayColor,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    '${index + 1}',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: whiteColor),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                    child: ListView.builder(
                                      controller: _scrollController,
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                          widget.examModel.questions.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            scrollToIndex(index);
                                            setState(() {
                                              currentQuestionIndex = index;
                                            });
                                          },
                                          child: Container(
                                            width: (width - 2 * 30) / 7,
                                            color: widget.examModel
                                                        .questions[index] ==
                                                    currentQuestion
                                                ? Colors.blue
                                                : grayColor,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                ],
                              ),
                            ),
                            // questions
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 8.h, left: kSpacing, right: kSpacing),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 18.0.h),
                                    child: Text(
                                      currentQuestion.questionText,
                                      style: GoogleFonts.ubuntu(
                                          fontSize: kLargeFontSize,
                                          fontWeight: FontWeight.w500,
                                          color: blackColor),
                                    ),
                                  ),
                                  Column(
                                    children: List.generate(
                                        currentQuestion.options.length,
                                        (index) {
                                      bool isActiveAnswer =
                                          objAnswers[currentQuestionIndex] ==
                                              index;

                                      String optionLetter = String.fromCharCode(
                                          'A'.codeUnitAt(0) + index);
                                      return Padding(
                                        padding: EdgeInsets.only(bottom: 16.h),
                                        child: GestureDetector(
                                          onTap: () {
                                            _choseQuestionIndex(
                                                currentQuestionIndex, index);
                                          },
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 40.w,
                                                height: 40.h,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  gradient: isActiveAnswer
                                                      ? indexGradient
                                                      : null,
                                                  shape: BoxShape.circle,
                                                  color: grayColor,
                                                ),
                                                child: Text(
                                                  optionLetter,
                                                  style: GoogleFonts.ubuntu(
                                                    color: whiteColor,
                                                    fontSize: kTitleFontSize,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 8.0.w),
                                                  child: Text(
                                                    currentQuestion
                                                        .options[index],
                                                    style: GoogleFonts.ubuntu(
                                                      fontSize: kSmallFontSize,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: isActiveAnswer
                                                          ? Colors.blue
                                                          : Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                  // Spacer(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // buttons
                    Container(
                      padding: EdgeInsets.only(bottom: 30.h),
                      color: whiteColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // prev
                          GestureDetector(
                            onTap: _previousQuestion,
                            child: currentQuestionIndex != 0
                                ? Container(
                                    height: 50.h,
                                    width: 50.w,
                                    decoration: BoxDecoration(
                                      gradient: indexGradient,
                                      shape: BoxShape.circle,
                                      color: const Color(0xffd4d4d4),
                                    ),
                                    child: Icon(Icons.arrow_back_ios_new,
                                        color: whiteColor),
                                  )
                                : SizedBox(
                                    height: 50.h,
                                    width: 50.w,
                                  ),
                          ),
                          // submit

                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Kết thúc'),
                                    content: const Text(
                                        'Bạn có muốn kết thúc câu hỏi?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pushAndRemoveUntil(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ResutlScreen(
                                                totalTime: _totalTime,
                                                correctAnswers:
                                                    calculateCorrectAnswers(),
                                                totalQuestions: widget
                                                    .examModel.questions.length,
                                                questions: questionsA1,
                                                userAnswers: objAnswers,
                                              ),
                                            ),
                                            (route) => false,
                                          );
                                        },
                                        child: const Text(
                                          'Yes',
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text(
                                          'No',
                                          style: TextStyle(color: Colors.blue),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Container(
                              width: 195.w,
                              height: 50.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.blue)),
                              child: Center(
                                child: GradientText(
                                    text: 'Submit Quiz',
                                    gradient: textGradient,
                                    textStyle: GoogleFonts.ubuntu(
                                      fontSize: kLargeFontSize,
                                      fontWeight: FontWeight.w500,
                                    )),
                              ),
                            ),
                          ),
                          // next
                          GestureDetector(
                            onTap: objAnswers[currentQuestionIndex] != null &&
                                    !(currentQuestionIndex ==
                                        widget.examModel.questions.length - 1)
                                ? _nextQuestion
                                : null,
                            child: currentQuestionIndex !=
                                    widget.examModel.questions.length - 1
                                ? Container(
                                    height: 50.h,
                                    width: 50.w,
                                    decoration: BoxDecoration(
                                      gradient:
                                          objAnswers[currentQuestionIndex] !=
                                                      null &&
                                                  !(currentQuestionIndex ==
                                                      widget.examModel.questions
                                                              .length -
                                                          1)
                                              ? indexGradient
                                              : null,
                                      shape: BoxShape.circle,
                                      color: grayColor,
                                    ),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: whiteColor,
                                    ),
                                  )
                                : SizedBox(
                                    height: 50.h,
                                    width: 50.w,
                                  ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
