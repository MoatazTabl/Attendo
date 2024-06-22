import 'dart:convert';
import 'dart:io'as io;
import 'dart:io';


import 'package:attendo/core/networking/api_service.dart';
import 'package:attendo/core/networking/api_strings.dart';
import 'package:attendo/intro/admin/features/all_students_screen/view_model/model/AllStudentsModel.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/errors/failures.dart';

part 'modify_students_state.dart';

class ModifyStudentsCubit extends Cubit<ModifyStudentsState> {
  ModifyStudentsCubit() : super(ModifyStudentsInitial());

  String convertPhotoToString(File image) {
    final bytes = io.File(image.path).readAsBytesSync();
    String img64 = base64Encode(bytes);
    return img64;
  }

  modifyStudent(AllStudentsModel studentDetails) async {
   try
       {
         emit(ModifyStudentsLoading());
         final response =
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
       }
   on Exception catch (e) {
     if (e is DioException) {
       final k = ServerFailures.fromDioException(e);
       emit(ModifyStudentsFailure(errMessage: k.errorMessage));
     } else {
       emit(ModifyStudentsFailure(errMessage: "Un Expected error , try again"));
     }
   }
  }


  deleteStudent()
  {

    try
        {

        }

    on Exception catch (e) {
      if (e is DioException) {
        final k = ServerFailures.fromDioException(e);
        emit(ModifyStudentsFailure(errMessage: k.errorMessage));
      } else {
        emit(ModifyStudentsFailure(errMessage: "Un Expected error , try again"));
      }
    }

  }


}
