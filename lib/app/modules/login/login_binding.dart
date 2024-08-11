import 'package:get/get.dart';

import '../../../infrastructure/services/api/api_service.dart';
import '../../data/providers/login_provider.dart';
import '../../data/repositories/login_repository.dart';
import 'login_controller.dart';

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
