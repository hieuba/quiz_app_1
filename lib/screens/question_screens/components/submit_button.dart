// submit button
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/constants/padding.dart';
import 'package:quiz_app/constants/theme_data.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 195.w,
      height: 50.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.blue)),
      child: Center(
        child: GradientText(
            text: 'Chấm điểm',
            gradient: textGradient,
            textStyle: TextStyle(
              fontSize: kLargeFontSize,
              fontWeight: FontWeight.w500,
            )),
      ),
    );
  }
}
