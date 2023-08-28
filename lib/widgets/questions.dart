import 'package:flutter/material.dart';
import 'package:quiz_app/constants/padding.dart';
import 'package:quiz_app/widgets/question_and_minute.dart';

class Question extends StatelessWidget {
  const Question({
    super.key,
    required this.onTap,
    required this.text,
  });

  final void Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: kHPadding,
                width: 72,
                height: 72,
                decoration: const BoxDecoration(color: Color(0xffc4c4c4)),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    text,
                    style: const TextStyle(
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
                ],
              ),
              const Spacer(),
              const Center(
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Text('4.8')
                  ],
                ),
              ),
              const SizedBox(width: 12)
            ],
          ),
        ),
      ),
    );
  }
}
