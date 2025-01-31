import 'package:get/get.dart';

import '../../../infrastructure/services/api/api_endpoints.dart';
import '../../../infrastructure/services/api/api_service.dart';
import '../model/login_req_model.dart';
import '../model/login_res_model.dart';

class LoginProvider extends GetxService {
  final ApiService _apiService;

  LoginProvider({required ApiService apiService}) : _apiService = apiService;

  Future<LoginRes> login(LoginReq loginReq) async {
    try {
      final response = await _apiService.post(
        ApiEndpoints.login,
        data: loginReq.toJson(),
      );
      if (response.statusCode == 200) {
        return LoginRes.fromJson(response.data);
      } else {
        throw Exception('Failed to login: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error logging in: $e');
    }
  }
}
