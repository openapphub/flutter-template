import 'package:get/get.dart';

import 'package:flutter_template/infrastructure/services/storage/storage_keys.dart';
import 'package:flutter_template/infrastructure/services/storage/storage_service.dart';

import '../model/login_req_model.dart';
import '../providers/login_provider.dart';

// app/data/repositories/user_repository.dart

class LoginRepository {
  final LoginProvider _userProvider = Get.find<LoginProvider>();
  final StorageService _storageService = Get.find<StorageService>();

  Future<bool> login(String email, String password) async {
    try {
      final response =
          await _userProvider.login(LoginReq(email: email, password: password));
      _storageService.write(
          StorageKeys.authToken, response.data?.tokens?.access?.token);
      return true;
    } catch (e) {
      print('Login error: $e');
      return false;
    }
  }
}
