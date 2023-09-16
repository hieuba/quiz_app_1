import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/constants/theme_data.dart';

class InfoContainer extends StatelessWidget {
  const InfoContainer({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icons,
  });

  final String title;
  final String subTitle;
  final String icons;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40.h,
          width: 40.w,
          decoration: BoxDecoration(
            color: blackColor,
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: EdgeInsets.all(8.h),
            child: Image.asset(
              'assets/icons/$icons',
              color: whiteColor,
            ),
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: blackColor,
                ),
              ),
              Text(
                subTitle,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: tabbarColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
