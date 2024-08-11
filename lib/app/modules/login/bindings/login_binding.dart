import 'package:get/get.dart';

import 'package:flutter_template/app/data/providers/login_provider.dart';
import 'package:flutter_template/app/data/repositories/login_repository.dart';
import 'package:flutter_template/infrastructure/services/api/api_service.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginProvider>(
        () => LoginProvider(apiService: Get.find<ApiService>()));
    Get.lazyPut<LoginRepository>(() => LoginRepository());
    Get.lazyPut<LoginController>(
      () => LoginController(loginRepository: Get.find<LoginRepository>()),
    );
  }
}
