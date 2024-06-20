import 'dart:convert';
import 'dart:io' as io;
import 'dart:io';

import 'package:attendo/core/errors/failures.dart';
import 'package:attendo/core/helpers/cache_helper.dart';
import 'package:attendo/core/networking/api_service.dart';
import 'package:attendo/core/networking/api_strings.dart';
import 'package:attendo/intro/auth/sign_up/presentation/view/widgets/image_pick_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mobile_device_identifier/mobile_device_identifier.dart';

import '../models/sign_in_model.dart';
import '../models/user_data_model.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

//check if the registered user is instructor or student
  bool isStudent = false;

  //Sign in Form key
  GlobalKey<FormState> logInFormKey = GlobalKey();

  //logInPassword
  TextEditingController logInPassword = TextEditingController();

  //logInEmail
  TextEditingController logInEmail = TextEditingController();

  //Global formKey
  GlobalKey<FormState> formKey = GlobalKey();

  // auto validate for text form fields sign up
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  // auto validate for text form fields sign in
  AutovalidateMode autoValidateModeSignIn = AutovalidateMode.disabled;

  //Sign up name
  TextEditingController signUpName = TextEditingController();

  TextEditingController signUpLastName = TextEditingController();

  //Sign up email
  TextEditingController signUpEmail = TextEditingController();

  //Sign up national id
  TextEditingController signUpNationalId = TextEditingController();

  //Sign up password
  TextEditingController signUpPassword = TextEditingController();

  //Sign up confirm password
  TextEditingController confirmPassword = TextEditingController();

  ImagePickerInputController inputController = ImagePickerInputController();

//Sign up faculty
  String? signUpGrade;

  //Sign up grade
  String? signUpFaculty;

  String? deviceId;

  SignInModel? user;

  void clearSignUpFields() {
    signUpName.clear();
    signUpLastName.clear();
    signUpNationalId.clear();
    signUpEmail.clear();
    signUpPassword.clear();
    confirmPassword.clear();
  }

  void getDeviceId() async {
    final mobileDeviceIdentifier = await MobileDeviceIdentifier().getDeviceId();
    deviceId = mobileDeviceIdentifier;
  }

  String convertPhotoToString(File image) {
    final bytes = io.File(image.path).readAsBytesSync();
    String img64 = base64Encode(bytes);
    return img64;
  }

  signUp() async {
    try {
      emit(SignUpLoading());
      await ApiService().post(endpoint: ApiStrings.signUpEndPoint, data: {
        "name": "${signUpName.text} ${signUpLastName.text}",
        "email": signUpEmail.text,
        "password": signUpPassword.text,
        "national_id": signUpNationalId.text,
        "faculty": signUpFaculty,
        "grade": signUpGrade,
        "device_id": deviceId,
        "photo": convertPhotoToString(inputController.value!)
      });
      emit(SignUpSuccess());
    } on Exception catch (e) {
      if (e is DioException) {
        final k = ServerFailures.fromDioException(e);
        emit(SignUpFailure(errMessage: k.errorMessage));
      } else {
        emit(SignUpFailure(errMessage: "Un Expected error , try again"));
      }
    }
  }

  signIn() async {
    try {
      emit(LoginLoading());
      final response = await ApiService().post(
          endpoint: ApiStrings.logInEndPoint,
          data: {
            "email": logInEmail.text,
            "password": logInPassword.text,
            "device_id": deviceId
          });
      user = SignInModel.fromJson(response);
      final decodedToken = JwtDecoder.decode(user!.token);
      CacheHelper().saveData(key: ApiStrings.token, value: user!.token);
      CacheHelper().saveData(
          key: ApiStrings.userId, value: decodedToken[ApiStrings.userId]);
      emit(LoginSuccess());
    } on Exception catch (e) {
      if (e is DioException) {
        final k = ServerFailures.fromDioException(e);
        emit(LoginFailure(errMessage: k.errorMessage));
      } else {
        emit(LoginFailure(errMessage: "Un Expected error , try again"));
      }
    }
  }

  getUserData({required String userTypeEndPoint}) async {
    try {
      emit(GetUserLoading());
      final response = await ApiService().post(
          endpoint: userTypeEndPoint,
          data: {"user_id": CacheHelper().getData(key: ApiStrings.userId)});
      UserDataModel userData = UserDataModel.fromJson(response);
      emit(GetUserSuccess(userData: userData));
      return userData;
    } catch (e) {
      emit(GetUserFailure(errMessage: "Un Expected error , try again later"));
    }
  }
}
