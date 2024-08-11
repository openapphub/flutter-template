import 'package:get/get.dart';

import '../settings/settings_controller.dart';
import 'root_controller.dart';

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
