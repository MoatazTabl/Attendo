import 'package:attendo/core/networking/api_service.dart';
import 'package:attendo/core/networking/api_strings.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'modify_students_state.dart';

class ModifyStudentsCubit extends Cubit<ModifyStudentsState> {
  ModifyStudentsCubit() : super(ModifyStudentsInitial());

  modifyStudent() async {
    final response =
        await ApiService().post(endpoint: ApiStrings.modifyStudent, data: {
          "pk": 3,
          "name": "aaaa",
          "email": "mosetafa@stu.com",
          "photo": "iVBORw0KGgoAAAA....",
          "password": "computer",
          "national_id": "30208061204533",
          "device_id": "00-1B-63-84-45-E6",
          "faculty": "computer",
          "grade": "third"
        });
  }
}
