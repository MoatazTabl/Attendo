import 'package:attendo/core/networking/api_service.dart';
import 'package:attendo/core/networking/api_strings.dart';
import 'package:attendo/intro/admin/features/all_students_screen/view_model/model/AllStudentsModel.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/errors/failures.dart';

part 'get_all_students_state.dart';

class GetAllStudentsCubit extends Cubit<GetAllStudentsState> {
  GetAllStudentsCubit() : super(GetAllStudentsInitial());

  getAllStudents(String department, String grade) async {
    try {
      emit(GetAllStudentsLoading());
      var response = await ApiService().post(
          endpoint: ApiStrings.getAllStudents,
          data: {"faculty": department, "grade": grade});
      List<AllStudentsModel> students = [];
      for (int i = 0; i <= response.length; i++) {
        students.add(AllStudentsModel.fromJson(response[i]));
      }
      emit(GetAllStudentsSuccess());
    } on Exception catch (e) {
      if (e is DioException) {
        final k = ServerFailures.fromDioException(e);
        emit(GetAllStudentsFailure(errMessage: k.errorMessage));
      } else {
        emit(
            GetAllStudentsFailure(errMessage: "Un Expected error , try again"));
      }
    }
  }
}
