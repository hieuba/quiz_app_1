import 'package:flutter/material.dart';

class QuestionAndMinute extends StatelessWidget {
  const QuestionAndMinute({
    super.key,
    required this.image,
    required this.text,
  });

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(image),
        Text(
          text,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        )
      ],
    );
  }
}
