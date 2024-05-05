import 'package:attendo/core/errors/failures.dart';
import 'package:attendo/core/networking/api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_lecture_cubit.freezed.dart';
part 'create_lecture_state.dart';

class CreateLectureCubit extends Cubit<CreateLectureState> {
  CreateLectureCubit() : super(const CreateLectureState.initial());

  Future<void> createLecture({required Map data}) async {
    ApiService apiService = ApiService();
    emit(const CreateLectureState.initial());
    try {

          await apiService.post(endpoint: "postlecture/", data: data);
      emit(const CreateLectureState.addLecture());
    } on DioException catch (e) {
      final k = ServerFailures.fromDioException(e);
      emit(CreateLectureState.addError(k.errorMessage));
    }
  }
}
