import 'package:attendo/core/networking/api_service.dart';
import 'package:attendo/core/networking/api_strings.dart';
import 'package:attendo/intro/instructor/features/lecture_details/presentation/view_model/models.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../core/errors/failures.dart';

part 'generate_qr_state.dart';

class GenerateQrCubit extends Cubit<GenerateQrState> {
  GenerateQrCubit() : super(GenerateQrInitial());

  bool? startLecture;

  generateQrCode({required int lecturePk}) async {
    try {
      emit(GenerateQrLoading());
      final response = await ApiService()
          .post(endpoint: ApiStrings.generateCode, data: {"pk": lecturePk});
      String qrCode = QrCodeModel.fromJson(response).qr;
      emit(GenerateQrSuccess(qrCode: qrCode));
    } on Exception catch (e) {
      if (e is DioException) {
        final k = ServerFailures.fromDioException(e);
        emit(GenerateQrFailure(errMessage: k.errorMessage));
      } else {
        emit(GenerateQrFailure(errMessage: "Un Expected error , try again"));
      }
    }
  }
}
