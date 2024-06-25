import 'package:attendo/core/networking/api_service.dart';
import 'package:attendo/core/networking/api_strings.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../core/errors/failures.dart';
import '../data/model/append_student_model.dart';
import '../data/model/get_qr_code_model.dart';

part 'qr_state.dart';

class QrCubit extends Cubit<QrState> {
  QrCubit() : super(QrInitial());

  Future<String> getCode(int lectureId) async {
    final response = await ApiService()
        .post(endpoint: ApiStrings.getLatestCode, data: {"pk": lectureId});
    final lectureCode = GetQrCodeModel.fromJson(response);
    return lectureCode.qrCode;
  }

  Future<void> appendStudent(int lectureId, String studentName) async {
    try {
      final response =
          await ApiService().post(endpoint: ApiStrings.appendStudent, data: {
        "lecturepk": lectureId,
        "studentname": studentName,
        "authtime": DateFormat('HH:mm:ss').format(DateTime.now())
        },
      );
      final AppendStudentModel message = AppendStudentModel.fromJson(response);
      emit(QrSuccess(message.message));
    } on Exception catch (e) {
      if (e is DioException) {
        final k = ServerFailures.fromDioException(e);
        if (kDebugMode) {
          print(k.errorMessage);
        }
        emit(QrError(k.errorMessage));
      }
    }
  }
}
