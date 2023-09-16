import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

import 'package:quiz_app/components/appbar_custom.dart';
import 'package:quiz_app/components/start_quiz_button.dart';
import 'package:quiz_app/constants/padding.dart';
import 'package:quiz_app/constants/theme_data.dart';
import 'package:quiz_app/data/generate_map.dart';
import 'package:quiz_app/models/exam_model.dart';
import 'package:quiz_app/screens/detail/components/container_info.dart';
import 'package:quiz_app/screens/detail/components/custom_text.dart';
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
                            color: tabbarColor,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('assets/icons/icon_app.png'),
                            ),
                          ),
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
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(24),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: SingleChildScrollView(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Giải thích về bài thi',
                                                  style: TextStyle(
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w700,
                                                    color: blackColor,
                                                  ),
                                                ),
                                                SizedBox(height: 16.h),
                                                InfoContainer(
                                                  icons: 'number_question.png',
                                                  title:
                                                      '25/${examModel.total_question} Câu hỏi',
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
                                                  'Hãy đọc kỹ nội dung bên dưới để hiểu rõ về bài thi',
                                                  style: TextStyle(
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
                                                      'Nhấn vào các tùy chọn để chọn câu trả lời đúng nhất',
                                                ),
                                                TextCustom(
                                                  text: examModel.title ==
                                                          'Bằng lái A1'
                                                      ? 'Để thi đạt bạn cần đúng 21/25 câu hỏi'
                                                      : 'Để thi đạt bạn cần đúng 23/25 câu hỏi',
                                                ),
                                                const TextCustom(
                                                  text:
                                                      'Nhấp vào chấm điểm nếu bạn chắc chắn muốn hoàn thành bài thi',
                                                ),
                                                const TextCustom(
                                                  text:
                                                      'Nếu sai câu điểm liệt (dấu *) kết quả sẽ là KHÔNG ĐẠT',
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        // bat dau
                                        StartQuizButton(
                                          onTap: () {
                                            examModel.title == 'Bằng lái A1'
                                                ? Navigator.pushAndRemoveUntil(
                                                    context,
                                                    PageTransition(
                                                      child:
                                                          QuestionMotoBikeScreen(
                                                              key: UniqueKey(),
                                                              examModel:
                                                                  examModel),
                                                      type: PageTransitionType
                                                          .bottomToTop,
                                                    ),
                                                    (route) => false)
                                                : ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                    SnackBar(
                                                      duration: const Duration(
                                                        seconds: 1,
                                                      ),
                                                      backgroundColor:
                                                          blueColor,
                                                      content: const Text(
                                                        'Chúng tôi sẽ cập nhật sau!!',
                                                      ),
                                                    ),
                                                  );
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
