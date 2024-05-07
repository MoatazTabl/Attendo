import 'package:attendo/core/networking/api_service.dart';
import 'package:attendo/core/networking/api_strings.dart';
import 'package:attendo/intro/instructor/features/lecture_details/presentation/view_model/models.dart';
import 'package:attendo/intro/instructor/features/lecture_details/presentation/view_model/report_message_model.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';


import '../../../../../../core/errors/failures.dart';

part 'generate_qr_state.dart';

class GenerateQrCubit extends Cubit<GenerateQrState> {
  GenerateQrCubit() : super(GenerateQrInitial());


  bool? startLecture ;

  generateQrCode(int lecturePk) async {
    try {
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
