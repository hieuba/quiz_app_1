import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:quiz_app/components/question_motobike.dart';
import 'package:quiz_app/constants/theme_data.dart';
import 'package:quiz_app/screens/detail/detail_screen.dart';
import 'package:quiz_app/screens/home_page/bloc/exam_bloc.dart';

class MotoBike extends StatefulWidget {
  const MotoBike({
    super.key,
  });

  @override
  State<MotoBike> createState() => _MotoBikeState();
}

class _MotoBikeState extends State<MotoBike> {
  @override
  void initState() {
    examBloc.add(ExamInitEvent());
    super.initState();
  }

  final examBloc = ExamBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExamBloc, ExamState>(
      bloc: examBloc,
      builder: (context, state) {
        switch (state.runtimeType) {
          case ExamSuccessState:
            final successState = state as ExamSuccessState;

            return ListView.builder(
              padding: EdgeInsets.only(top: 16.h),
              itemCount: successState.examList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: DetailScreen(
                              examModel: successState.examList[index],
                            ),
                            type: PageTransitionType.bottomToTop));
                  },
                  child: QuestionMotoBike(
                    examModel: successState.examList[index],
                  ),
                );
              },
            );
          default:
            return SizedBox(
              child: Text(
                'khong co data',
                style: TextStyle(color: blackColor, fontSize: 16.sp),
              ),
            );
        }
      },
    );
  }
}
