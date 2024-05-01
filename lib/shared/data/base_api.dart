import 'package:dio/dio.dart';

class BaseApi {
  final Dio _dio = Dio();

  String baseUrl = "http://api.weatherapi.com/v1";

  Future<Response> get(String path) async {
    print(path);
    try {
      return await _dio.get('$baseUrl$path');
    } on DioException catch (error) {
      throw ApiException(_handleError(error));
    }
  }

  Future<Response> post(String path, dynamic data,
      {Map<String, dynamic>? headers}) async {
    print(path);
    try {
      return await _dio.post('$baseUrl$path',
          data: data,
          options: Options(
            responseType: ResponseType.json,
            contentType: 'application/json',
            // headers: headers,
          ));
    } on DioException catch (error) {
      throw ApiException(_handleError(error));
    }
  }

  Future<Response> put(String path, dynamic data) async {
    try {
      return await _dio.put('$baseUrl$path', data: data);
    } on DioException catch (error) {
      throw ApiException(_handleError(error));
    }
  }

  Future<Response> delete(String path) async {
    try {
      return await _dio.delete('$baseUrl$path');
    } on DioException catch (error) {
      throw ApiException(_handleError(error));
    }
  }

  String _handleError(DioException error) {
    if (error.response != null) {
      return 'Request failed with status code ${error.response!.statusCode}';
    } else {
      return 'Request failed: ${error.message}';
    }
  }
}

class ApiException implements Exception {
  final String message;

  ApiException(this.message);
}
