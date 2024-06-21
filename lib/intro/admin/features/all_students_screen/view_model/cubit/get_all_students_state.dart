part of 'get_all_students_cubit.dart';

@immutable
abstract class GetAllStudentsState {}

class GetAllStudentsInitial extends GetAllStudentsState {}
class GetAllStudentsSuccess extends GetAllStudentsState {

}
class GetAllStudentsLoading extends GetAllStudentsState {}
class GetAllStudentsFailure extends GetAllStudentsState {
 final String errMessage;

  GetAllStudentsFailure({required this.errMessage});
}
