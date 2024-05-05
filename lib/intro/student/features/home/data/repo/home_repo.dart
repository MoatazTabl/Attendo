import 'package:attendo/core/errors/failures.dart';
import 'package:attendo/core/networking/api_service.dart';
import 'package:attendo/core/networking/api_strings.dart';
import 'package:attendo/intro/student/features/home/data/models/students_lectures_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepo {
  Future<Either<Failures, List<StudentsLecturesModel>>> fetchStudentsLectures(
      {required Map data}) async {
    try {
      ApiService apiService = ApiService();
      var response = await apiService.post(
          endpoint: ApiStrings.studentLecturesEndpoint, data: data);
      List<StudentsLecturesModel> lectures = [];

      for (var item in response['result']) {
        lectures.add(StudentsLecturesModel.fromJson(item));
      }

      return right(lectures);
    } catch (error) {
      if (error is DioException) {
        return left(
          ServerFailures.fromDioException(
            error,
          ),
        );
      }
      return left(
        ServerFailures(
          error.toString(),
        ),
      );
    }
  }
}
