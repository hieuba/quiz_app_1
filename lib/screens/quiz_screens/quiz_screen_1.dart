import 'package:flutter/material.dart';
import 'package:quiz_app/constants/padding.dart';
import 'package:quiz_app/constants/theme_data.dart';
import 'package:quiz_app/data/question_list.dart';
import 'package:quiz_app/models/quiz_question.dart';
import 'package:quiz_app/screens/result/result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int? selectedOptionIndex;

  Map<int, dynamic> objAnswers = generateMap(questions.length);

  final ScrollController _scrollController = ScrollController();

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

  void scrollToIndex(int index) {
    if ((index >= 4 && index <= 6) || (index >= 3 && index <= 5)) {
      double screenWidth = MediaQuery.of(context).size.width;
      double itemWidth = screenWidth / 7;

      double centerOffset =
          itemWidth * index + (itemWidth / 2) - (screenWidth / 2);

      _scrollController.animateTo(
        centerOffset,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void _nextQuestion() {
    var newIndex = currentQuestionIndex + 1;
    scrollToIndex(newIndex);
    setState(() {
      currentQuestionIndex = newIndex;
    });
  }

  void _previousQuestion() {
    var newIndex = currentQuestionIndex - 1 > 0 ? currentQuestionIndex - 1 : 0;
    scrollToIndex(newIndex);
    setState(() {
      currentQuestionIndex = newIndex;
    });
  }

  void _choseQuestionIndex(currentQuestIndex, answerIndex) {
    setState(() {
      objAnswers = {...objAnswers, currentQuestIndex: answerIndex};
    });
  }

  @override
  Widget build(BuildContext context) {
    QuestionModel currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      // layout
      body: Container(
        decoration: BoxDecoration(
          gradient: appBarGradient,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            // tabbar
            Padding(
              padding: kVPadding,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Image.asset('assets/images/back.png'),
                  ),
                  Text(
                    'Question 1.1 QUIZ',
                    style: TextStyle(
                        fontSize: kTitleFontSize,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: 72,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/12.png'),
                        const Text('15:00'),
                      ],
                    ),
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
                child: Column(
                  children: [
                    // questions index and questions list
                    Expanded(
                      child: Container(
                        color: whiteColor,
                        child: Column(
                          children: [
                            Padding(
                              padding: kVPadding,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue,
                                ),
                                height: 4,
                                width: 48,
                              ),
                            ),
                            // index questions
                            Container(
                              // margin: EdgeInsets.symmetric(horizontal: 20),
                              color: whiteColor,
                              height: 100,
                              child: Column(
                                children: [
                                  Expanded(
                                    // flex: 3,
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
                                            // margin: const EdgeInsets.only(
                                            //     right: 14),
                                            decoration: BoxDecoration(
                                              gradient: questions[index] ==
                                                      currentQuestion
                                                  ? indexGradient
                                                  : null,
                                              shape: BoxShape.circle,
                                              color: grayColor,
                                            ),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                7,
                                            child: Center(
                                              child: Text(
                                                '${index + 1}',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: whiteColor),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2,
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
                                            // margin: const EdgeInsets.only(
                                            //     right: 14),

                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                7,
                                            color: questions[index] ==
                                                    currentQuestion
                                                ? Colors.blue
                                                : grayColor,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                            // questions
                            Padding(
                              padding: kHPadding,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 27.0),
                                    child: Text(
                                      currentQuestion.questionText,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
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
                                        padding:
                                            const EdgeInsets.only(bottom: 16),
                                        child: GestureDetector(
                                          onTap: () {
                                            _choseQuestionIndex(
                                                currentQuestionIndex, index);
                                          },
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 40,
                                                height: 40,
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
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Text(
                                                  currentQuestion
                                                      .options[index],
                                                  style: TextStyle(
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
                      padding: const EdgeInsets.only(bottom: 30),
                      color: whiteColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // prev
                          GestureDetector(
                            onTap: _previousQuestion,
                            child: currentQuestionIndex != 0
                                ? Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      gradient: indexGradient,
                                      shape: BoxShape.circle,
                                      color: const Color(0xffd4d4d4),
                                    ),
                                    child: const Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.white,
                                    ),
                                  )
                                : const SizedBox(),
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
                              width: 195,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.blue)),
                              child: Center(
                                child: GradientText(
                                    text: 'Submit Quiz',
                                    gradient: textGradient,
                                    textStyle: const TextStyle(
                                      fontSize: 16,
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
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      gradient:
                                          objAnswers[currentQuestionIndex] !=
                                                      null &&
                                                  !(currentQuestionIndex ==
                                                      questions.length - 1)
                                              ? indexGradient
                                              : null,
                                      shape: BoxShape.circle,
                                      color: const Color(0xffd4d4d4),
                                    ),
                                    child: const Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                    ),
                                  )
                                : const SizedBox(),
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
