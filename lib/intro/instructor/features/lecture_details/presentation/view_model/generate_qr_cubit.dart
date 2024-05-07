import 'package:attendo/core/networking/api_service.dart';
import 'package:attendo/core/networking/api_strings.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'generate_qr_state.dart';

class GenerateQrCubit extends Cubit<GenerateQrState> {
  GenerateQrCubit() : super(GenerateQrInitial());

  generateQrCode(int lecturePk) async {
    await ApiService().post(endpoint: ApiStrings.generateCode, data: {
      "pk":lecturePk
    });

  }
}
