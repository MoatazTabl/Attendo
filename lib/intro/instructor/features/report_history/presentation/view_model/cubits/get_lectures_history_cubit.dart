import 'package:attendo/core/networking/api_service.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../../../../../core/errors/failures.dart';
import '../../../../../../../core/networking/api_strings.dart';
import '../models/ReportHistoryLectures.dart';

part 'get_lectures_history_state.dart';

class GetLecturesHistoryCubit extends Cubit<GetLecturesHistoryState> {
  GetLecturesHistoryCubit() : super(GetLecturesHistoryInitial());

  getLecturesHistory(String instructorName) async {
    try {
      emit(GetLecturesHistoryLoading());
      final response =
          await ApiService().post(endpoint: ApiStrings.getLectureList, data: {
        "instructor":instructorName
      });
      List<ReportHistoryLectures> lectures = [];
      for (var item in response['result']) {
        lectures.add(ReportHistoryLectures.fromJson(item) );
      }
      emit(GetLecturesHistorySuccess(lectures: lectures));
    } on Exception catch (e) {
      if (e is DioException) {
        final k = ServerFailures.fromDioException(e);
        emit(GetLecturesHistoryFailure(errMessage: k.errorMessage));
      } else {
        emit(GetLecturesHistoryFailure(
            errMessage: "Un Expected error , try again"));
      }
    }
  }
}
