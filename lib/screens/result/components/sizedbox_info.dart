import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/constants/theme_data.dart';

class SizedboxInfo extends StatelessWidget {
  const SizedboxInfo({
    super.key,
    required this.image,
    required this.text,
  });

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.black12,
      height: 40.h,
      child: Row(
        children: [
          SizedBox(height: 20.h, width: 20.w, child: Image.asset(image)),
          Text(
            text,
            style: textStye,
          ),
        ],
      ),
    );
  }
}

var textStye = TextStyle(
  fontSize: 16.sp,
  fontWeight: FontWeight.w500,
  color: whiteColor,
);
