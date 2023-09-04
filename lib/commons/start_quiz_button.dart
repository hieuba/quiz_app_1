import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/constants/theme_data.dart';

class StartQuizButton extends StatelessWidget {
  const StartQuizButton({
    super.key,
    required this.onTap,
  });

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.h,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: startQuizGradient,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            'Bắt đầu',
            style: GoogleFonts.ubuntu(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: whiteColor),
          ),
        ),
      ),
    );
  }
}
