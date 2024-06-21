import 'package:attendo/core/networking/api_service.dart';
import 'package:attendo/core/networking/api_strings.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_all_students_state.dart';

class GetAllStudentsCubit extends Cubit<GetAllStudentsState> {
  GetAllStudentsCubit() : super(GetAllStudentsInitial());

  getAllStudents(String department , String grade) {
    final response =
        ApiService().post(endpoint: ApiStrings.getAllStudents, data: {
          "faculty": department,
          "grade": grade
        });

  }
}
