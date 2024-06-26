part of 'get_report_cubit.dart';

@immutable
abstract class GetReportState {}

class GetReportInitial extends GetReportState {}

class GetReportSuccess extends GetReportState {
  final GetReportModel getReportModel;

  GetReportSuccess({required this.getReportModel});
}

class GetAttendingStudentsSuccess extends GetReportState {
  final AttendingAnalyticsModel attendingAnalyticsModel;

  GetAttendingStudentsSuccess({required this.attendingAnalyticsModel});
}

class GetReportLoading extends GetReportState {}

class GetReportFailure extends GetReportState {
  final String errMessage;

  GetReportFailure({required this.errMessage});
}
