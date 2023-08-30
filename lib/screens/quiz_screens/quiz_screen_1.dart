import 'package:flutter/material.dart';
import 'package:quiz_app/constants/padding.dart';
import 'package:quiz_app/data/question_list.dart';
import 'package:quiz_app/models/quiz_question.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int? selectedOptionIndex;

  int correctAnswers = 0; // To keep track of correct answers
  Map<int, dynamic> objAnswers = generateMap(questions.length);

  List<String> _selectedAnswer = [];

  final ScrollController _scrollController = ScrollController();

  void _nextQuestion() {
    var newIndex = currentQuestionIndex + 1;
    scrollToIndex(newIndex);
    print(newIndex);
    setState(() {
      currentQuestionIndex = newIndex;
    });
    // if (currentQuestionIndex < questions.length - 1) {
    //   setState(() {
    //     currentQuestionIndex++;
    //     selectedOptionIndex =
    //         null; // Clear selected option for the next question
    //   });
    // }
  }

  // Map<int, dynamic> result = generateMap(questions.length);
  // array = [1,2,3,...n]
  // value = {
  //   1 : null,
  //   2 : null ,
  //   ....
  //   n : null
  // }

  // var ob = {
  //   0 : null,
  //   1 : null,
  //   2 : null
  // }

  // ob[currrentIndex] = null;
  void _previousQuestion() {
    var newIndex = currentQuestionIndex - 1 > 0 ? currentQuestionIndex - 1 : 0;
    scrollToIndex(newIndex);
    setState(() {
      currentQuestionIndex = newIndex;
    });
  }

//_showResultScreen(1, 2)
  void _showResultScreen(currentQuestIndex, answerIndex) {
    // thay doi index bang index cua cau tra loi
    // (currentQuestIndex , answerIndex)
    // {[currentQuestIndex] : 1 , 2 : null}
    print(currentQuestIndex);
    print(answerIndex);
    print({...objAnswers, currentQuestIndex: answerIndex});
    setState(() {
      objAnswers = {...objAnswers, currentQuestIndex: answerIndex};
    });
  }

  void chooseAnswer(String answer) {
    _selectedAnswer.add(answer);
    if (_selectedAnswer.length == questions.length) {
      setState(() {
        // selectedAnswer = [];
        // activeScreen = 'result-screen';
      });
    }
  }

  void scrollToIndex(int index) {
    if (index >= 0 && index < questions.length) {
      _scrollController.animateTo(
        index * 56.0, // Assuming each item has a height of 56.0
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

// void chooseAnswerByIndex(int _index) {
//    ob = {
//     1 : null ,
//     2 : null,
//     ... ,
//     n : null
//    }=>
//    ob = {
//     1 : _index ,
//     2 : null,
//     ... ,
//     n : null
//    }
//    ob[currentQuestionIndex] = _index;
//   }
  @override
  void initState() {
    // TODO: implement initState
    print(objAnswers);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    QuestionModel currentQuestion = questions[currentQuestionIndex];

    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        // height: double.infinity,
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
              padding: kVPadding,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Image.asset('assets/images/back.png'),
                  ),
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
            Expanded(
                child: Container(
              // color: Colors.amber,

              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        padding: kHPadding,
                        width: double.infinity,
                        color: Colors.red.shade100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              color: Colors.amber,
                              height: 100,
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
                                      margin: const EdgeInsets.only(right: 14),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:
                                            questions[index] == currentQuestion
                                                ? Colors.blue.shade300
                                                : Colors.grey,
                                      ),
                                      height: 50,
                                      width: width / 10,
                                      child: Center(
                                        child: Text(
                                          '${index + 1}',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  currentQuestion.questionText,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                Column(
                                  children: List.generate(
                                      currentQuestion.options.length, (index) {
                                    bool isActiveAnswer =
                                        objAnswers[currentQuestionIndex] ==
                                            index;

                                    // print()
                                    String optionLetter = String.fromCharCode(
                                        'A'.codeUnitAt(0) + index);
                                    return ListTile(
                                      title:
                                          Text(currentQuestion.options[index]),
                                      onTap: () {
                                        _showResultScreen(
                                            currentQuestionIndex, index);
                                        // setState(() {
                                        //   selectedOptionIndex = index;
                                        // });
                                      },
                                      leading: Container(
                                        width: 30,
                                        height: 30,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: isActiveAnswer
                                              ? Colors.blue
                                              : Colors.grey,
                                        ),
                                        child: Text(
                                          optionLetter,
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                                // Spacer(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.amber,
                      child: Row(
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
                            onTap: () {},
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
                            onTap: objAnswers[currentQuestionIndex] != null
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
                    )
                  ],
                ),
              ),
            ))
            // const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
