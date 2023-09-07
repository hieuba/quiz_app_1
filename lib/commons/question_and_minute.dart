import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/constants/theme_data.dart';

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
        SizedBox(width: 5.w),
        Text(
          text,
          style: TextStyle(
            color: tabbarColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }
}
