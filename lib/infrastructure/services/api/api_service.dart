import 'package:dio/dio.dart';
import 'api_endpoints.dart';
import 'api_interceptors.dart';

class ApiService {
  late Dio _dio;

  Future<ApiService> init() async {
    _dio = Dio(BaseOptions(
      baseUrl: ApiEndpoints.baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
      headers: {
        'Content-Type': ApiEndpoints.contentType,
        'Accept': ApiEndpoints.contentType,
      },
    ));
    _dio.interceptors.add(ApiInterceptors());
    return this;
  }

  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      return await _dio.get(path, queryParameters: queryParameters);
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  Future<Response> post(String path,
      {dynamic data, Map<String, dynamic>? queryParameters}) async {
    try {
      return await _dio.post(path,
          data: data, queryParameters: queryParameters);
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  Future<Response> put(String path,
      {dynamic data, Map<String, dynamic>? queryParameters}) async {
    try {
      return await _dio.put(path, data: data, queryParameters: queryParameters);
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  Future<Response> delete(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      return await _dio.delete(path, queryParameters: queryParameters);
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  Response _handleError(DioException e) {
    print('API Error: ${e.message}');
    return Response(
      requestOptions: e.requestOptions,
      statusCode: e.response?.statusCode ?? 500,
      data: e.response?.data ?? {'message': 'An unexpected error occurred'},
    );
  }
}
