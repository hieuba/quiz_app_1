import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quiz_app/data/exams.dart';
import 'package:quiz_app/models/exam_model.dart';

part 'exam_event.dart';
part 'exam_state.dart';

class ExamBloc extends Bloc<ExamEvent, ExamState> {
  ExamBloc() : super(ExamInitial()) {
    on<ExamInitEvent>(examInitEvent);
  }

  FutureOr<void> examInitEvent(ExamInitEvent event, Emitter<ExamState> emit) {
    emit(ExamSuccessState(
        examList: ExamData.exams.map((e) {
      return ExamModel(
        questions: e['questions'],
        time: e['time'],
        category: e['category'],
        id: e['id'],
        description: e['description'],
        title: e['title'],
        total_question: e['total_question'],
      );
    }).toList()));
  }
}
