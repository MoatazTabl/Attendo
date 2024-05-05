import 'package:attendo/core/errors/failures.dart';
import 'package:attendo/core/networking/api_service.dart';
import 'package:attendo/core/networking/api_strings.dart';
import 'package:attendo/intro/instructor/features/home/presentation/data/models/InstructorLecturesModel.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeInstructorRepo {
  Future<Either<Failures, List<InstructorLecturesModel>>>
      fetchInstructorLectures({required Map data}) async {
    try {
      ApiService apiService = ApiService();
      var response = await apiService.post(
          endpoint: ApiStrings.instructorLecturesEndpoint, data: data);
      // print(response["result"]);
      List<InstructorLecturesModel> lectures = [];

      for (var item in response["result"]) {
        lectures.add(InstructorLecturesModel.fromJson(item));
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
