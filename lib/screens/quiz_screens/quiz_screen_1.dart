import 'package:flutter/material.dart';
import 'package:quiz_app/constants/padding.dart';
import 'package:quiz_app/data/question_list.dart';
import 'package:quiz_app/models/quiz_question.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int? selectedOptionIndex;

  int correctAnswers = 0; // To keep track of correct answers

  List<String> _selectedAnswer = [];

  void _nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedOptionIndex =
            null; // Clear selected option for the next question
      });
    }
  }

  void _previousQuestion() {
    if (currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--;
        selectedOptionIndex =
            null; // Clear selected option for the previous question
      });
    }
  }

  void _showResultScreen() {}

  void chooseAnswer(String answer) {
    _selectedAnswer.add(answer);
    if (_selectedAnswer.length == questions.length) {
      setState(() {
        // selectedAnswer = [];
        // activeScreen = 'result-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    QuestionModel currentQuestion = questions[currentQuestionIndex];
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff0083ff),
              Color(0xff87ceff),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: kPadding,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BackButton(),
                  Text(
                    'Let\'s test your knowledge',
                    style: TextStyle(
                        fontSize: kTitleFontSize,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: 20,
                    height: 10,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
              child: Expanded(
                child: Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 0; i < questions.length; i++)
                            Container(
                              width: 32,
                              height: 32,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 14),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: i == currentQuestionIndex
                                    ? Colors.blue
                                    : Colors.grey,
                              ),
                              child: Center(
                                child: Text('${i + 1}'),
                              ),
                            ),
                        ],
                      ),
                      Text(
                        currentQuestion.questionText,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Column(
                        children: List.generate(currentQuestion.options.length,
                            (index) {
                          String optionLetter =
                              String.fromCharCode('A'.codeUnitAt(0) + index);
                          return ListTile(
                            title: Text(currentQuestion.options[index]),
                            onTap: () {
                              setState(() {
                                selectedOptionIndex = index;
                              });
                            },
                            tileColor: selectedOptionIndex == index
                                ? Colors.blue.withOpacity(0.3)
                                : null,
                            leading: Container(
                              width: 30,
                              height: 30,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: selectedOptionIndex == index
                                    ? Colors.blue
                                    : Colors.grey,
                              ),
                              child: Text(
                                optionLetter,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                        }),
                      ),
                      SizedBox(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: _previousQuestion,
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue,
                              ),
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: _showResultScreen,
                            child: Container(
                              width: 195,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.blue)),
                              child: const Center(
                                child: Text('Submit Quiz'),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: selectedOptionIndex != null
                                ? _nextQuestion
                                : null,
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue,
                              ),
                              child: const Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ), // Add some spacing
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
