import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/constants/padding.dart';
import 'package:quiz_app/constants/theme_data.dart';
import 'package:quiz_app/data/question_list.dart';
import 'package:quiz_app/models/quiz_question.dart';
import 'package:quiz_app/screens/result/result_screen.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;

  late int _totalTime;
  final int _seconds = 300;

  final CountdownController _countdownController =
      CountdownController(autoStart: true);

  Map<int, dynamic> objAnswers = generateMap(questions.length);

  // scrollController Index
  final ScrollController _scrollController = ScrollController();
  // total correct answers
  int calculateCorrectAnswers() {
    int correctAnsewers = 0;

    for (var i = 0; i < questions.length; i++) {
      if (objAnswers.containsKey(i) &&
          objAnswers[i] == questions[i].correctOptionIndex) {
        correctAnsewers++;
      }
    }
    return correctAnsewers;
  }

  // scroll index
  void scrollToIndex(int index) {
    if ((index >= 4 && index <= 6) || (index >= 3 && index <= 5)) {
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
  Widget build(BuildContext context) {
    QuestionModel currentQuestion = questions[currentQuestionIndex];
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
            // tabbar
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
                  Text('Question 1.1 QUIZ', style: titleStyte),
                  Container(
                    width: 72.w,
                    height: 24.h,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                                color: Colors.blue,
                              ),
                            );
                          },
                          interval: const Duration(milliseconds: 1000),
                          onFinished: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return ResutlScreen(
                                  totalTime: _totalTime,
                                  totalQuestions: questions.length,
                                  correctAnswers: calculateCorrectAnswers(),
                                  questions: questions,
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
                                  color: Colors.blue,
                                ),
                                height: 4.h,
                                width: 48.w,
                              ),
                            ),
                            // index questions
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 30.w),
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
                                      itemCount: questions.length,
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
                                                margin: EdgeInsets.all(7.w),
                                                width: width / 7,
                                                decoration: BoxDecoration(
                                                  gradient: questions[index] ==
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
                                      itemCount: questions.length,
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
                                            color: questions[index] ==
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
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 8.0.w),
                                                child: Text(
                                                  currentQuestion
                                                      .options[index],
                                                  style: GoogleFonts.ubuntu(
                                                    fontSize: kSmallFontSize,
                                                    fontWeight: FontWeight.w400,
                                                    color: isActiveAnswer
                                                        ? Colors.blue
                                                        : Colors.black,
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
                                                totalQuestions:
                                                    questions.length,
                                                questions: questions,
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
                                        questions.length - 1)
                                ? _nextQuestion
                                : null,
                            child: currentQuestionIndex != questions.length - 1
                                ? Container(
                                    height: 50.h,
                                    width: 50.w,
                                    decoration: BoxDecoration(
                                      gradient:
                                          objAnswers[currentQuestionIndex] !=
                                                      null &&
                                                  !(currentQuestionIndex ==
                                                      questions.length - 1)
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
