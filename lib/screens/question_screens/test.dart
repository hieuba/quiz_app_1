import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/data/a1.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

import 'package:quiz_app/constants/padding.dart';
import 'package:quiz_app/constants/theme_data.dart';
import 'package:quiz_app/data/generate_map.dart';
import 'package:quiz_app/models/question_model.dart';
import 'package:quiz_app/screens/result/result_screen.dart';

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

  Map<int, dynamic> objAnswers = generateMap(0);

  // Hàm để xáo trộn danh sách câu hỏi
  List shuffleQuestions(List inputQuestions) {
    var random = Random();
    var questions = List.from(inputQuestions);
    for (var i = questions.length - 1; i > 0; i--) {
      var j = random.nextInt(i + 1);
      var temp = questions[i];
      questions[i] = questions[j];
      questions[j] = temp;
    }
    return questions;
  }

  // Hàm đọc dữ liệu từ tệp JSON và nạp vào danh sách questions
  /* void _loadQuestions() async {
    try {
      final file =
          File('/Users/hieuba/Desktop/QUIZ/quiz_app/assets/data/demo.json');

//       var exam1<> = {
//         questions: file,
//         title: 'Thi A1',
//         time: 10000000,
//         description?: '',
//         category : 'moto',
//         id : '1'
//       };
// var exam2<> = {
//         questions: file,
//         title: 'Thi A1',
//         time: 10000000,
//         description?: '',
//          category : 'oto'
//       };

//       var exams  = [exam1, exam2, ...];

// var examHonda = exams.

      final jsonString = file.readAsStringSync();

      final jsonData = jsonDecode(jsonString) as List;
      print(jsonData);
      // final jsonString = await rootBundle.loadString('assets/data/demo.json');

      // final jsonData = jsonDecode(jsonString) as List;
      // print(jsonData);

      // Xáo trộn danh sách câu hỏi
      final shuffledQuestions = shuffleQuestions(jsonData);

      // Lấy 10 câu hỏi đầu tiên sau khi đã xáo trộn
      final selectedQuestions = shuffledQuestions.take(10).toList();

      questions = selectedQuestions.map((data) {
        return QuestionModel(
          questionText: data['questionText'],
          options: List<String>.from(data['options']),
          correctOptionIndex: data['correctOptionIndex'],
        );
      }).toList();
      objAnswers = generateMap(questions.length);
    } catch (e) {
      // ignore: avoid_print
      print('Đã xảy ra lỗi khi đọc tệp JSON: $e');
    }
  } */

  // scrollController Index
  final ScrollController _scrollController = ScrollController();
  // total correct answers
  int calculateCorrectAnswers() {
    int correctAnsewers = 0;

    for (var i = 0; i < questionsA1.length; i++) {
      if (objAnswers.containsKey(i) &&
          objAnswers[i] == questionsA1[i].correctOptionIndex) {
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

  // @override
  // void initState() {
  //   _loadQuestions();
  //   super.initState();
  // }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    QuestionModel currentQuestion = questionsA1[currentQuestionIndex];
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
                  Text('Question 1.1 QUIZ', style: titleStyte),
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
                              style: TextStyle(
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
                                  totalQuestions: questionsA1.length,
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
                                      itemCount: questionsA1.length,
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
                                                margin: EdgeInsets.all(7),
                                                width: width / 7,
                                                decoration: BoxDecoration(
                                                  gradient:
                                                      questionsA1[index] ==
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
                                      itemCount: questionsA1.length,
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
                                            color: questionsA1[index] ==
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
                                      style: TextStyle(
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
                                                  style: TextStyle(
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
                                                    style: TextStyle(
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
                                                totalQuestions:
                                                    questionsA1.length,
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
                                    textStyle: TextStyle(
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
                                        questionsA1.length - 1)
                                ? _nextQuestion
                                : null,
                            child: currentQuestionIndex !=
                                    questionsA1.length - 1
                                ? Container(
                                    height: 50.h,
                                    width: 50.w,
                                    decoration: BoxDecoration(
                                      gradient:
                                          objAnswers[currentQuestionIndex] !=
                                                      null &&
                                                  !(currentQuestionIndex ==
                                                      questionsA1.length - 1)
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
