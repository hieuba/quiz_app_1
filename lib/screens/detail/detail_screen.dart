import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:quiz_app/commons/appbar_custom.dart';
import 'package:quiz_app/commons/start_quiz_button.dart';
import 'package:quiz_app/constants/padding.dart';

import 'package:quiz_app/constants/theme_data.dart';
import 'package:quiz_app/data/generate_map.dart';
import 'package:quiz_app/models/exam_model.dart';
import 'package:quiz_app/screens/question_screens/questions_motobike_screen.dart';

// ignore: must_be_immutable
class DetailScreen extends StatelessWidget {
  const DetailScreen({
    super.key,
    required this.examModel,
  });

  final ExamModel examModel;

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      // layout
      body: SafeArea(
        bottom: false,
        top: false,
        child: Container(
          decoration: BoxDecoration(
            gradient: appBarGradient,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: 28.h),
              // tabbar
              Padding(
                  padding: EdgeInsets.only(
                      top: topPadding,
                      bottom: kSpacing,
                      left: kSpacing,
                      right: kSpacing),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppBarCustom(
                        title: 'Chi tiết',
                        icon: 'back.png',
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        widget: Container(
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                              color: tabbarColor, shape: BoxShape.circle),
                        ),
                      ),
                      Padding(
                        padding: kVPadding,
                        child: Text(
                          examModel.title,
                          style: titleStyte,
                        ),
                      ),
                    ],
                  )),

              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.r),
                    topRight: Radius.circular(25.r),
                  ),
                  child: Column(
                    children: [
                      // questions index and questions list
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          color: whiteColor,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 12.h),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: blueColor,
                                    ),
                                    height: 4.h,
                                    width: 48.w,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(24),
                                  child: SizedBox(
                                    width: double.infinity,
                                    // color: Colors.amber.shade100,
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: SingleChildScrollView(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Giải thích ngắn gọn về bài thi',
                                                  style: GoogleFonts.nunito(
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w700,
                                                    color: blackColor,
                                                  ),
                                                ),
                                                SizedBox(height: 16.h),
                                                InfoContainer(
                                                  icons: 'number_question.png',
                                                  title:
                                                      '${examModel.total_question} Câu hỏi',
                                                  subTitle:
                                                      '1 điểm cho câu trả lời đúng',
                                                ),
                                                SizedBox(height: 16.h),
                                                InfoContainer(
                                                  icons: 'timer.png',
                                                  title:
                                                      convertSecondsToMinutes(
                                                          examModel.time
                                                              .toString()),
                                                  subTitle:
                                                      'Tổng thời lượng bài thi',
                                                ),
                                                SizedBox(height: 24.h),
                                                Text(
                                                  'Please read the text below carefully so you can understand it',
                                                  style: GoogleFonts.nunito(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w700,
                                                    color: blackColor,
                                                  ),
                                                ),
                                                SizedBox(height: 16.h),
                                                const TextCustom(
                                                  text:
                                                      'Trả lời đúng được 1 điểm, trả lời sai không có điểm',
                                                ),
                                                const TextCustom(
                                                  text:
                                                      'Nhấn vào các tùy chọn để chọn câu trả lời đúng',
                                                ),
                                                TextCustom(
                                                  text: examModel.title ==
                                                          'Bằng A1'
                                                      ? 'Để thi đạt bạn cần đúng 21/25 câu hỏi'
                                                      : 'Để thi đạt bạn cần đúng 23/25 câu hỏi',
                                                ),
                                                const TextCustom(
                                                  text:
                                                      'Nhấp vào chấm điểm nếu bạn chắc chắn muốn hoàn thành tất cả các câu đố',
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        StartQuizButton(
                                          onTap: () {
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                PageTransition(
                                                    child:
                                                        QuestionMotoBikeScreen(
                                                            examModel:
                                                                examModel),
                                                    type: PageTransitionType
                                                        .bottomToTop),
                                                (route) => false);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
              style: GoogleFonts.nunito(
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
                style: GoogleFonts.ubuntu(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: blackColor,
                ),
              ),
              Text(
                subTitle,
                style: GoogleFonts.nunito(
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
