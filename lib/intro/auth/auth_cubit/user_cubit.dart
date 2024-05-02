import 'package:attendo/core/networking/api_service.dart';
import 'package:attendo/core/networking/api_strings.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:meta/meta.dart';

import '../../../core/cache_helper.dart';
import '../models/sign_in_model.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());


//check if the registered user is instructor or student
  bool isStudent = false;


  //logInPassword
  TextEditingController logInPassword = TextEditingController();

  //logInEmail
  TextEditingController logInEmail = TextEditingController();


  //Global formKey
  GlobalKey<FormState> formKey = GlobalKey();


  // auto validate for text form fields
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

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


  SignInModel? user;

  signUp() async {
    try {
      emit(SignUpLoading());
       await ApiService().post(endpoint: ApiStrings.signUpEndPoint, data: {
        "name":signUpName.text,
        "email":signUpEmail.text,
        "password":signUpPassword.text,
        "national_id":signUpNationalId.text,
        "faculty":signUpFaculty.text,
        "grade":signUpGrade.text,

      }
      );
      emit(SignUpSuccess());
    } catch (e) {
      emit(SignUpFailure(errMessage: "Un Expected error , Try again later"));
    }
  }


  signIn() async {
    try {
      emit(LoginLoading());
      final response = await ApiService().post(endpoint: ApiStrings.logInEndPoint, data: {
        "email": logInEmail.text,
        "password": logInPassword.text,
      });
      user = SignInModel.fromJson(response);
      final decodedToken = JwtDecoder.decode(user!.token);
      CacheHelper().saveData(key: ApiStrings.token, value: user!.token);
      CacheHelper().saveData(key: ApiStrings.userId, value: decodedToken[ApiStrings.userId]);
      emit(LoginSuccess());
    }  catch (e) {
      emit(LoginFailure(errMessage: "Un Expected error , try again later"));
    }
  }




}
