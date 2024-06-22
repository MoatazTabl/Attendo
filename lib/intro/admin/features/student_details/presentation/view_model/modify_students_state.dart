part of 'modify_students_cubit.dart';

@immutable
abstract class ModifyStudentsState {}

class ModifyStudentsInitial extends ModifyStudentsState {}
class ModifyStudentsSuccess extends ModifyStudentsState {

}
class ModifyStudentsLoading extends ModifyStudentsState {}
class ModifyStudentsFailure extends ModifyStudentsState {

 final String errMessage;

  ModifyStudentsFailure({required this.errMessage});
}
//-----------------------------------------------
class DeleteStudentsSuccess extends ModifyStudentsState {

}
class DeleteStudentsLoading extends ModifyStudentsState {}
class DeleteStudentsFailure extends ModifyStudentsState {

 final String errMessage;

 DeleteStudentsFailure({required this.errMessage});
}

