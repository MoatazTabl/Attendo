part of 'create_lecture_cubit.dart';

@freezed
class CreateLectureState with _$CreateLectureState {
  const factory CreateLectureState.initial() = _Initial;
  const factory CreateLectureState.addLecture() = AddLecture;
  const factory CreateLectureState.addError(String errorMessage) = AddError;
}
