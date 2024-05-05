part of 'edit_lecture_cubit.dart';

@freezed
class EditLectureState with _$EditLectureState {
  const factory EditLectureState.initial() = _Initial;

  const factory EditLectureState.editLectureDone() = EditLectureDone;

  const factory EditLectureState.editError(String errorMessage) = EditError;
}
