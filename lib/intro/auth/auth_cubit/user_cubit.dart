import 'package:attendo/core/errors/failures.dart';
import 'package:attendo/core/networking/api_service.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());




  //Sign up name
  TextEditingController signUpName = TextEditingController();

  //Sign up email
  TextEditingController signUpEmail = TextEditingController();

  //Sign up national id
  TextEditingController signUpNationalId = TextEditingController();

  //Sign up password
  TextEditingController signUpPassword = TextEditingController();

  //Sign up confirm password
  TextEditingController confirmPassword = TextEditingController();

//Sign up faculty
  TextEditingController signUpGrade = TextEditingController();

  //Sign up grade
  TextEditingController signUpFaculty = TextEditingController();


  signUp() async {
    try {
      emit(SignUpLoading());
      final response = await ApiService().post(endpoint: 'register/', data: {
        "name":signUpName.text,
        "email":signUpEmail.text,
        "password":signUpPassword.text,
        "national_id":signUpNationalId.text,
        "faculty":signUpFaculty.text,
        "grade":signUpGrade.text,

      }
      );
      emit(SignUpSuccess());
    } on ServerFailures catch (e) {
      emit(SignUpFailure(errMessage: e.errorMessage));
    }
  }


}
