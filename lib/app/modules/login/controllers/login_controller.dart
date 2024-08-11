import 'package:flutter_template/app/data/repositories/login_repository.dart';
import 'package:flutter_template/infrastructure/services/ui/ui_service.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final LoginRepository loginRepository;
  final UIService _uiService = Get.find<UIService>();

  LoginController({required this.loginRepository});

  Future<void> login(String email, String password) async {
    _uiService.showLoading();
    try {
      final success = await loginRepository.login(email, password);
      _uiService.hideLoading();
      if (success) {
        _uiService.showToast('登录成功！');
        // TODO: 导航到主页或执行其他登录后操作
      } else {
        _uiService.showToast('登录失败，请检查您的邮箱和密码。');
      }
    } catch (e) {
      _uiService.hideLoading();
      _uiService.showToast('登录出错: $e');
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
