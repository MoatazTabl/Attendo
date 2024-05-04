import 'package:attendo/intro/instructor/features/home/presentation/data/models/InstructorLecturesModel.dart';
import 'package:attendo/intro/instructor/features/home/presentation/data/repo/home_instructor_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_instructor_cubit.freezed.dart';
part 'home_instructor_state.dart';

class HomeInstructorCubit extends Cubit<HomeInstructorState> {
  HomeInstructorCubit() : super(const HomeInstructorState.initial());

  Future<void> getStudentLectures({required Map data}) async {
    emit(const HomeInstructorState.dataFetching());
    var homeInstructorRepo = HomeInstructorRepo();

    var lecturesAvailable = await homeInstructorRepo.fetchInstructorLectures(data: data);

    lecturesAvailable.fold(
            (fail) => emit(
            HomeInstructorState.dataError(fail.errorMessage)
        ),
            (lectures) {
          if (lectures.isEmpty) {
            emit(const HomeInstructorState.lecturesNotAvailable());
          }
          else {
            emit(HomeInstructorState.lecturesAvailable(lectures));
          }
        }
    );
  }

}
