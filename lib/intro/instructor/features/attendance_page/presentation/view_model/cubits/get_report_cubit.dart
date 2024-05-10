import 'package:attendo/core/networking/api_service.dart';
import 'package:attendo/core/networking/api_strings.dart';
import 'package:attendo/intro/instructor/features/attendance_page/presentation/view_model/models/GetReportModel.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../../../../../core/errors/failures.dart';

part 'get_report_state.dart';

class GetReportCubit extends Cubit<GetReportState> {
  GetReportCubit() : super(GetReportInitial());

  getReport(int lecturePk) async {
    try {
      emit(GetReportLoading());
     final response =
          await ApiService().post(endpoint: ApiStrings.getReport, data: {
            "lecturepk": lecturePk,
            "date": DateTime.now().toIso8601String().split(".")[0]
          });
     final report = GetReportModel.fromJson(response);
     emit(GetReportSuccess(getReportModel: report));
    } on Exception catch (e) {
      if (e is DioException) {
        final k = ServerFailures.fromDioException(e);
        emit(GetReportFailure(errMessage: k.errorMessage));
      } else {
        emit(GetReportFailure(errMessage: "Un Expected error , try again"));
      }
    }
  }
}
