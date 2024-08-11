import 'package:get/get.dart';

import '../../../infrastructure/navigation/navigation_controller.dart';
import 'main_controller.dart';

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
