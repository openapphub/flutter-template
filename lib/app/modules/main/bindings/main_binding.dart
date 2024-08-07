import 'package:get/get.dart';

import '../controllers/main_controller.dart';
import 'package:flutter_template/infrastructure/navigation/navigation_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationController>(
      () => NavigationController(),
    );
    Get.lazyPut<MainController>(
      () => MainController(),
    );
  }
}
