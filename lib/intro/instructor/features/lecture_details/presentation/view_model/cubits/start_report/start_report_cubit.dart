import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../core/errors/failures.dart';
import '../../../../../../../../core/networking/api_service.dart';
import '../../../../../../../../core/networking/api_strings.dart';
import '../../report_message_model.dart';

part 'start_report_state.dart';

class StartReportCubit extends Cubit<StartReportState> {
  StartReportCubit() : super(StartReportInitial());

  startReport({required int lecturePk}) async {
    try {
      final response = await ApiService().post(
          endpoint: ApiStrings.startReport, data: {"lecturepk": lecturePk});

      ReportMessageModel reportMessage = ReportMessageModel.fromJson(response);
      emit(StartReportSuccess(reportMessage: reportMessage));
    } on Exception catch (e) {
      if (e is DioException) {
        final k = ServerFailures.fromDioException(e);
        emit(StartReportFailure(errMessage: k.errorMessage));
      } else {
        emit(StartReportFailure(errMessage: "Un Expected error , try again"));
      }
    }
  }
}
