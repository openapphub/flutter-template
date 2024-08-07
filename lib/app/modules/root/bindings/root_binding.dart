import 'package:flutter_template/app/modules/settings/controllers/settings_controller.dart';
import 'package:get/get.dart';

import '../controllers/root_controller.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsController>(
      () => SettingsController(),
    );
    Get.lazyPut<RootController>(
      () => RootController(),
    );
  }
}
