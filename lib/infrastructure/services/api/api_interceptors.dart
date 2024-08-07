import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import '../storage/storage_service.dart';
import '../storage/storage_keys.dart';

class ApiInterceptors extends dio.Interceptor {
  final StorageService _storageService = Get.find<StorageService>();
  final dio.Dio _dioInstance = dio.Dio(); // 用于刷新token的Dio实例

  @override
  Future<void> onRequest(
      dio.RequestOptions options, dio.RequestInterceptorHandler handler) async {
    final String? token = _storageService.read<String>(StorageKeys.authToken);
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    print('REQUEST[${options.method}] => PATH: ${options.path}');
    handler.next(options);
  }

  @override
  void onResponse(
      dio.Response response, dio.ResponseInterceptorHandler handler) {
    print(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    handler.next(response);
  }

  @override
  Future<void> onError(
      dio.DioException err, dio.ErrorInterceptorHandler handler) async {
    print(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');

    if (err.response?.statusCode == 401) {
      // Token可能已失效，尝试刷新
      if (await _refreshToken()) {
        // Token刷新成功，重试原请求
        return handler.resolve(await _retry(err.requestOptions));
      } else {
        // Token刷新失败，重定向到登录页面
        print('Unable to refresh token. Redirecting to login...');
        Get.offAllNamed('/login');
      }
    }

    handler.next(err);
  }

  Future<bool> _refreshToken() async {
    try {
      final refreshToken =
          _storageService.read<String>(StorageKeys.refreshToken);
      if (refreshToken == null) return false;

      final response = await _dioInstance.post(
        'YOUR_REFRESH_TOKEN_ENDPOINT',
        data: {'refresh_token': refreshToken},
      );

      if (response.statusCode == 200) {
        final newToken = response.data['access_token'];
        _storageService.write(StorageKeys.authToken, newToken);
        return true;
      }
    } catch (e) {
      print('Error refreshing token: $e');
    }
    return false;
  }

  Future<dio.Response<dynamic>> _retry(
      dio.RequestOptions requestOptions) async {
    final options = dio.Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );

    return _dioInstance.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }
}
