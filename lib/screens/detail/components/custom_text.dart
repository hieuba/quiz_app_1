import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/constants/theme_data.dart';

class TextCustom extends StatelessWidget {
  const TextCustom({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 6.h,
            width: 6.w,
            decoration: BoxDecoration(
              color: blackColor,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 16.h),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: blackColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
