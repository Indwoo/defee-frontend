import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio;

  ApiClient(this._dio);

  Future<Response> fetchData() async {
    try {
      final response = await _dio.get('http://localhost:8080/api/data');  // API 엔드포인트
      return response;
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
}
