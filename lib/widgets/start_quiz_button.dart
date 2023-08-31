import 'package:flutter/material.dart';
import 'package:quiz_app/constants/theme_data.dart';

class StartQuizButton extends StatelessWidget {
  const StartQuizButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: startQuizGradient,
          borderRadius: BorderRadius.circular(5),
        ),
        child: const Center(
          child: Text(
            'Start Quiz',
            style: TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
