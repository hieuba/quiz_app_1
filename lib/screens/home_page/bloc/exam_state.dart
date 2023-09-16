part of 'exam_bloc.dart';

@immutable
sealed class ExamState {}

sealed class ExamActionState extends ExamState {}

final class ExamInitial extends ExamState {}

class ExamSuccessState extends ExamState {
  final List<ExamModel> examList;

  ExamSuccessState({required this.examList});
}

class ExamError extends ExamState {}
