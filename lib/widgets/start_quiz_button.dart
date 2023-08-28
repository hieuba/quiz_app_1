import 'package:flutter/material.dart';

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
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff0083ff),
              Color(0xff87ceff),
            ],
          ),
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
