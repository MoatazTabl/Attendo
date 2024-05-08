import 'package:attendo/core/errors/failures.dart';
import 'package:attendo/core/networking/api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_lecture_cubit.freezed.dart';
part 'edit_lecture_state.dart';

class EditLectureCubit extends Cubit<EditLectureState> {
  EditLectureCubit() : super(const EditLectureState.initial());

  Future<void> editLecture({required Map data}) async {
    ApiService apiService = ApiService();
    emit(const EditLectureState.initial());
    try {
      await apiService.post(endpoint: "editlecture/", data: data);
      emit(const EditLectureState.editLectureDone());
    } on DioException catch (e) {
      final k = ServerFailures.fromDioException(e);
      emit(EditLectureState.editError(k.errorMessage));
    }
  }

}
