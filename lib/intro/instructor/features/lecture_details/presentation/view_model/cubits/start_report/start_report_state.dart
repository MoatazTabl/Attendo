part of 'start_report_cubit.dart';

@immutable
abstract class StartReportState {}

class StartReportInitial extends StartReportState {}

class StartReportSuccess extends StartReportState {
  final ReportMessageModel reportMessage;

  StartReportSuccess({required this.reportMessage});
}

class StartReportLoading extends StartReportState {}

class StartReportFailure extends StartReportState {
  final String errMessage;

  StartReportFailure({required this.errMessage});
}
