import 'package:attendo/core/networking/api_service.dart';
import 'package:attendo/core/networking/api_strings.dart';
import 'package:attendo/intro/instructor/features/attendance_page/presentation/view_model/models/GetReportModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_report_state.dart';

class GetReportCubit extends Cubit<GetReportState> {
  GetReportCubit() : super(GetReportInitial());

  getReport(int lecturePk,String date) async {
    try {
      emit(GetReportLoading());
     final response =
          await ApiService().post(endpoint: ApiStrings.getReport, data: {
            "lecturepk": lecturePk,
            "date": date
          });
     final report = GetReportModel.fromJson(response);
     emit(GetReportSuccess(getReportModel: report));
    } on Exception catch (e) {
      if (e is DioException) {
        emit(GetReportFailure(errMessage: "No Students"));
      } else {
        emit(GetReportFailure(errMessage: "Un Expected error , try again"));
      }
    }
  }
}
