part of 'home_instructor_cubit.dart';

@freezed
class HomeInstructorState with _$HomeInstructorState {
  const factory HomeInstructorState.initial() = _Initial;

  const factory HomeInstructorState.dataFetching() = DataFetching;

  const factory HomeInstructorState.lecturesAvailable(
      List<InstructorLecturesModel> studentsLecturesModel) = LecturesAvailable;

  const factory HomeInstructorState.lecturesNotAvailable() =
      LecturesNotAvailable;

  const factory HomeInstructorState.dataError(String error) = DataError;

  const factory HomeInstructorState.lectureSkipped() = LectureSkipped;
}
