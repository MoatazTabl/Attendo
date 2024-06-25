part of 'get_lectures_reports_cubit.dart';

@immutable
abstract class GetLecturesReportsState {}

class GetLecturesReportsInitial extends GetLecturesReportsState {}
class GetLecturesReportsSuccess extends GetLecturesReportsState {

 final List<GetReportModel>  reportModel;

  GetLecturesReportsSuccess({required this.reportModel});
}
class GetLecturesReportsLoading extends GetLecturesReportsState {}
class GetLecturesReportsFailure extends GetLecturesReportsState {
 final String errMessage;

  GetLecturesReportsFailure({required this.errMessage});
}
