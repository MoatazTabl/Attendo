part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

/// Login States
final class LoginSuccess extends UserState {}

final class LoginLoading extends UserState {}


final class LoginFailure extends UserState {
  final String errMessage;
  LoginFailure({required this.errMessage});
}

//---------------------------------------------------------------------

///SignUp States
final class SignUpSuccess extends UserState {

}

final class SignUpLoading extends UserState {}

final class  SignUpFailure extends UserState {
  final String errMessage;
  SignUpFailure({required this.errMessage});
}

//--------------------------------------------------------------------

/// User Data States
final class GetUserSuccess extends UserState {
  final UserDataModel userData;
  GetUserSuccess({required this.userData});
}

final class GetUserLoading extends UserState {}

final class GetUserFailure extends UserState {
 final String errMessage;
  GetUserFailure({required this.errMessage});
}
