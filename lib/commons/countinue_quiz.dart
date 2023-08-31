import 'package:flutter/material.dart';
import 'package:quiz_app/commons/question_and_minute.dart';

class CountinueQuiz extends StatelessWidget {
  const CountinueQuiz({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (direction) {},
      key: const Key(''),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 112,
            width: 112,
            decoration: const BoxDecoration(
              color: Color(0xffc4c4c4),
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Animation',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue),
              ),
              const QuestionAndMinute(
                image: 'assets/images/44.png',
                text: '10 Questions',
              ),
              const QuestionAndMinute(
                image: 'assets/images/12.png',
                text: '10 mins',
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 32,
                decoration: BoxDecoration(
                  color: const Color(0xff333333),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Center(
                  child: Text(
                    'Countinue Quiz',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
