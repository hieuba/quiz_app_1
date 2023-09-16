// previos button
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/constants/theme_data.dart';

class PreviosButton extends StatelessWidget {
  const PreviosButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 50.w,
      decoration: BoxDecoration(
        gradient: indexGradient,
        shape: BoxShape.circle,
        color: const Color(0xffd4d4d4),
      ),
      child: Icon(Icons.arrow_back_ios_new, color: whiteColor),
    );
  }
}
