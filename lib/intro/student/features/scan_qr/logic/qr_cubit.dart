import 'package:attendo/core/errors/failures.dart';
import 'package:attendo/core/networking/api_service.dart';
import 'package:attendo/core/networking/api_strings.dart';
import 'package:attendo/intro/student/features/scan_qr/data/model/append_student_model.dart';
import 'package:attendo/intro/student/features/scan_qr/data/model/get_qr_code_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

part 'qr_cubit.freezed.dart';

part 'qr_state.dart';

class QrCubit extends Cubit<QrState> {
  QrCubit() : super(const QrState.initial());

  getLectureCode(int lectureId) async {
    final response = await ApiService()
        .post(endpoint: ApiStrings.getLatestCode, data: {"pk": lectureId});
    final GetQrCodeModel lectureCode = GetQrCodeModel.fromJson(response);
    return lectureCode.qrCode;
  }

  Future<void> scanQr(BuildContext context, Barcode generatedCode,
      String lectureCode, int lecturePk, String studentName) async {
    try {
      if (generatedCode.rawValue == lectureCode) {
        final appendStudentState = await appendStudent(lecturePk, studentName);
        customShowDialog(context, appendStudentState);
      } else {
        customShowDialog(context, "Wrong! This is not the correct QR code.");
      }
    } on Exception catch (e) {
      if (e is DioException) {
        final k = ServerFailures.fromDioException(e);
      }
    }
  }

  appendStudent(int lectureId, String studentName) async {
    try {
      final response =
          await ApiService().post(endpoint: ApiStrings.appendStudent, data: {
        "lecturepk": lectureId,
        "studentname": studentName,
        "authtime": DateFormat('HH:mm:ss').format(DateTime.now())
      });
      final AppendStudentModel message = AppendStudentModel.fromJson(response);
      return message.message;
    } on Exception catch (e) {
      if (e is DioException) {
        final k = ServerFailures.fromDioException(e);
        return k.errorMessage;
      } else {
        return "Un Expected error , try again";
      }
    }
  }

  void customShowDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("QR Code Scan Result"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
