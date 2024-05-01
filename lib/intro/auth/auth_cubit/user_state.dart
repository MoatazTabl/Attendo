part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

/// Login States
final class LoginSuccess extends UserState {}

final class LoginLoading extends UserState {}


final class LoginFailure extends UserState {
  String errMessage;
  LoginFailure({required this.errMessage});
}

//---------------------------------------------------------------------

///SignUp States
final class SignUpSuccess extends UserState {
  String message;
  SignUpSuccess({required this.message});
}

final class SignUpLoading extends UserState {}

final class SignUpFailure extends UserState {
  String errMessage;
  SignUpFailure({required this.errMessage});
}

//--------------------------------------------------------------------

/// User Data States
// final class GetUserSuccess extends UserState {
//   UserDataModel userData;
//   GetUserSuccess({required this.userData});
// }
//
// final class GetUserLoading extends UserState {}
//
// final class GetUserFailure extends UserState {
//   String errMessage;
//   GetUserFailure({required this.errMessage});
// }
