import 'package:dio/dio.dart';

class ApiService {
  final String _baseUrl = "http://0.tcp.eu.ngrok.io:18834/";

  final Dio _dio = Dio();

  Future<Map<String, dynamic>> get({required String endpoint}) async {
    var response = await _dio.get(
      "$_baseUrl$endpoint",
    );
    return response.data;
  }

  Future<Map<String,dynamic>> post({required String endpoint,required Map data})async
  {
    var response= await _dio.post("$_baseUrl$endpoint",data: data);
    return response.data;
  }
}
