import 'package:dio/dio.dart';

class ApiService {
  final String _baseUrl = "https://api.themoviedb.org/3/";

  final Dio _dio = Dio();

  Future<Map<String, dynamic>> get({required String endpoint}) async {
    var response = await _dio.get(
      "$_baseUrl$endpoint",
    );
    return response.data;
  }
}
