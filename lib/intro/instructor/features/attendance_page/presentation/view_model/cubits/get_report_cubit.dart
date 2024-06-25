import 'dart:async';

import 'package:attendo/core/networking/api_service.dart';
import 'package:attendo/core/networking/api_strings.dart';
import 'package:attendo/intro/instructor/features/attendance_page/presentation/view_model/models/attending_students_model.dart';
import 'package:attendo/intro/instructor/features/attendance_page/presentation/view_model/models/get_report_model.dart';
import 'package:dio/dio.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_report_state.dart';

class GetReportCubit extends Cubit<GetReportState> {
  GetReportCubit() : super(GetReportInitial());

  getReport(int lecturePk, String date) async {
    try {
      emit(GetReportLoading());
      final response = await ApiService().post(
          endpoint: ApiStrings.getReport,
          data: {"lecturepk": lecturePk, "date": date});
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

  Future<void> getAnalytics({required int lecturePk}) async {
    try {
      final response = await ApiService().get(
        endpoint: "${ApiStrings.getReportsStudent}/$lecturePk/",
      );

      var analytics = AttendingAnalyticsModel.fromJson(response);
      emit(GetAttendingStudentsSuccess(attendingAnalyticsModel: analytics));
    } on Exception catch (e) {
      if (e is DioException) {
        emit(GetReportFailure(errMessage: e.response.toString()));
      }
    }
  }

// Future<GetReportsModel?> getReports(int lecturePk) async {
//   try {
//     final response = await ApiService().post(
//       endpoint: ApiStrings.getReports,
//       data: {"lecturepk": lecturePk},
//     );
//
//     var reports = GetReportsModel.fromJson(response);
//
//     return reports;
//   } on Exception catch (e) {
//     if (kDebugMode) {
//       print(e.toString());
//     }
//   }
//   return null;
// }

//   Stream<AttendingAnalyticsModel?> getStudentNumbersStream(
//       {required int lecturePk}) async* {
//     try {
//       GetReportsModel? getReportsModel = await getReports(lecturePk);
//       Response<AttendingAnalyticsModel> response =await ApiService().getStream(
//         endpoint: "getreportstudents/${getReportsModel?.result?[0].pk}/",
//       );
//
//     yield response.data;
//     } on Exception catch (e) {
//       if (e is DioException) {
//         emit(GetReportFailure(errMessage: "No Students"));
//       } else {
//         emit(GetReportFailure(errMessage: "Un Expected error , try again"));
//       }
//     }
//   }
// }
}
