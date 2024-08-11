import 'package:flutter_template/infrastructure/services/logger/log_service.dart';
import 'package:flutter_template/infrastructure/services/ui/ui_service.dart';
import 'package:get/get.dart';
import 'infrastructure/services/storage/storage_service.dart';
import 'infrastructure/services/api/api_service.dart';
import 'core/theme/theme_service.dart';
import 'core/translation/translation_service.dart';

class Initializer {
  static Future<void> init() async {
    try {
      await _initServices();
    } catch (err) {
      rethrow;
    }
  }

  static Future<void> _initServices() async {
    await Get.putAsync(() => StorageService().init());
    await Get.putAsync(() => ApiService().init());
    await Get.putAsync(() => ThemeService().init());
    await Get.putAsync(() => TranslationService().init());
    await Get.putAsync(() => UIService().init()); // 添加 UIService
    await Get.putAsync(() => LogService().init());
  }
}
