import 'package:attendo/core/networking/api_service.dart';
import 'package:attendo/core/networking/api_strings.dart';
import 'package:attendo/intro/admin/features/all_students_screen/view_model/model/all_students_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      for (var item in response['result']) {
        students.add(AllStudentsModel.fromJson(item));
      }
      emit(GetAllStudentsSuccess(students: students));
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
