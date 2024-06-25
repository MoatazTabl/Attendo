import 'package:attendo/core/networking/api_service.dart';
import 'package:attendo/core/networking/api_strings.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../../../../../core/errors/failures.dart';
import '../../../../attendance_page/presentation/view_model/models/get_report_model.dart';

part 'get_lectures_reports_state.dart';

class GetLecturesReportsCubit extends Cubit<GetLecturesReportsState> {
  GetLecturesReportsCubit() : super(GetLecturesReportsInitial());

  getLectureReport(int lecturePk) async {
    try {
      emit(GetLecturesReportsLoading());
      final response = await ApiService().post(
          endpoint: ApiStrings.getReports, data: {"lecturepk": lecturePk});
      List<GetReportModel> report = [];
      for (var item in response['result']) {
        report.add(GetReportModel.fromJson(item));
      }
      emit(GetLecturesReportsSuccess(reportModel: report));
    } on Exception catch (e) {
      if (e is DioException) {
        final k = ServerFailures.fromDioException(e);
        emit(GetLecturesReportsFailure(errMessage: k.errorMessage));
      } else {
        emit(GetLecturesReportsFailure(
            errMessage: "Un Expected error , try again"));
      }
    }
  }
}
