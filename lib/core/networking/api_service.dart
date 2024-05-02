import 'package:attendo/core/networking/api_strings.dart';
import 'package:dio/dio.dart';

class ApiService {


  final Dio _dio = Dio();

  Future<Map<String, dynamic>> get({required String endpoint}) async {
    var response = await _dio.get(
      "${ApiStrings.baseUrl}$endpoint",
    );
    return response.data;
  }

  Future<Map<String,dynamic>> post({required String endpoint,required Map data})async
  {
    var response= await _dio.post("${ApiStrings.baseUrl}$endpoint",data: data);
    return response.data;
  }
}
