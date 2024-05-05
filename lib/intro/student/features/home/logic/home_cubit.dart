import 'package:attendo/intro/student/features/home/data/models/students_lectures_model.dart';
import 'package:attendo/intro/student/features/home/data/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'home_cubit.freezed.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState.initial());

  Future<void> getStudentLectures({required Map data}) async {
    emit(const HomeState.dataFetching());
    var homeRepo = HomeRepo();

    var lecturesAvailable = await homeRepo.fetchStudentsLectures(data: data);

    lecturesAvailable.fold(
        (fail) => emit(HomeState.dataError(fail.errorMessage)), (lectures) {
      if (lectures.isEmpty) {
        emit(const HomeState.lecturesNotAvailable());
      } else {
        emit(HomeState.lecturesAvailable(lectures));
      }
    });
  }
}
