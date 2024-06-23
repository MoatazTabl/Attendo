
import 'package:attendo/core/networking/api_service.dart';
import 'package:attendo/core/networking/api_strings.dart';
import 'package:attendo/intro/admin/features/all_students_screen/view_model/model/all_students_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/errors/failures.dart';

part 'modify_students_state.dart';

class ModifyStudentsCubit extends Cubit<ModifyStudentsState> {
  ModifyStudentsCubit() : super(ModifyStudentsInitial());


  modifyStudent(AllStudentsModel studentDetails) async {
    try {
      emit(ModifyStudentsLoading());
          await ApiService().post(endpoint: ApiStrings.modifyStudent, data: {
        "pk": studentDetails.pk,
        "name": studentDetails.name,
        "email": studentDetails.email,
        "national_id": studentDetails.nationalId,
        "device_id": studentDetails.deviceId,
        "faculty": studentDetails.faculty,
        "grade": studentDetails.grade
      });
      emit(ModifyStudentsSuccess());
    } on Exception catch (e) {
      if (e is DioException) {
        final k = ServerFailures.fromDioException(e);
        emit(ModifyStudentsFailure(errMessage: k.errorMessage));
      } else {
        emit(
            ModifyStudentsFailure(errMessage: "Un Expected error , try again"));
      }
    }
  }

  deleteStudent(int studentId) async {
    try {
      emit(DeleteStudentsLoading());
          await ApiService().post(endpoint: ApiStrings.deleteStudent, data: {
            "user_id": studentId
          });
      emit(DeleteStudentsSuccess());
    } on Exception catch (e) {
      if (e is DioException) {
        final k = ServerFailures.fromDioException(e);
        emit(DeleteStudentsFailure(errMessage: k.errorMessage));
      } else {
        emit(
            DeleteStudentsFailure(errMessage: "Un Expected error , try again"));
      }
    }
  }
}
