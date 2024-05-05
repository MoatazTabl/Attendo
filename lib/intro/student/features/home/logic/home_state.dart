part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  const factory HomeState.dataFetching() = DataFetching;

  const factory HomeState.lecturesAvailable(
      List<StudentsLecturesModel> studentsLecturesModel) = LecturesAvailable;

  const factory HomeState.lecturesNotAvailable() = LecturesNotAvailable;

  const factory HomeState.dataError(String error) = DataError;
}
