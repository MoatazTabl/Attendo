part of 'get_lectures_history_cubit.dart';

@immutable
abstract class GetLecturesHistoryState {}

class GetLecturesHistoryInitial extends GetLecturesHistoryState {}

class GetLecturesHistorySuccess extends GetLecturesHistoryState {
 final List<ReportHistoryLectures> lectures;

  GetLecturesHistorySuccess({required this.lectures});
}

class GetLecturesHistoryLoading extends GetLecturesHistoryState {}

class GetLecturesHistoryFailure extends GetLecturesHistoryState {
 final String errMessage;

  GetLecturesHistoryFailure({required this.errMessage});
}
